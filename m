Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web08.3727.1631239312558043401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 19:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from [10.200.20.196] (unknown [10.200.20.196])
	by smtp0.taitradio.net (Postfix) with ESMTP id F2263E0134;
	Fri, 10 Sep 2021 14:01:49 +1200 (NZST)
Subject: Re: [OE-core][PATCH v2 1/2] reproducible_build: Remove BUILD_REPRODUCIBLE_BINARIES checking
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
 openembedded-core@lists.openembedded.org
References: <20210910012901.19993-1-mark.hatle@kernel.crashing.org>
 <20210910012901.19993-2-mark.hatle@kernel.crashing.org>
From: "Douglas" <douglas.royds@taitradio.com>
Message-ID: <5ff2b0a2-9ee0-f8a9-9a4d-6c792ba66f99@taitradio.com>
Date: Fri, 10 Sep 2021 14:01:49 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910012901.19993-2-mark.hatle@kernel.crashing.org>
Content-Type: multipart/alternative;
 boundary="------------C657E41F55B10D2D930C4E85"
Content-Language: en-GB

--------------C657E41F55B10D2D930C4E85
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/21 1:29 pm, Mark Hatle wrote:
> From: Mark Hatle <mark.hatle@xilinx.com>
>
> Previously if BUILD_REPRODUCIBLE_BINARIES was set to 0, the system would
> fall back and select the default epoch (April 2011), but still perform
> the reproducible build actions.  This resulted in binaries that had an
> unusually old date.
>
> Simplify the functions and remove the anonymous python as no longer
> necessary.
>
> Also improve the documentation to better explain what the class is doing
> and how a recipe can override the behavior if necessary.
>
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>   meta/classes/reproducible_build.bbclass | 53 ++++++++++++++++---------
>   1 file changed, 34 insertions(+), 19 deletions(-)
>
> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
> index 378121903d..96bb012243 100644
> --- a/meta/classes/reproducible_build.bbclass
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -1,17 +1,38 @@
>   # reproducible_build.bbclass
>   #
> -# Sets SOURCE_DATE_EPOCH in each component's build environment.
> +# Sets the default SOURCE_DATE_EPOCH in each component's build environment.
> +# The format is number of seconds since the system epoch.
> +#
>   # Upstream components (generally) respect this environment variable,
>   # using it in place of the "current" date and time.
>   # See https://reproducible-builds.org/specs/source-date-epoch/
>   #
> -# After sources are unpacked but before they are patched, we set a reproducible value for SOURCE_DATE_EPOCH.
> -# This value should be reproducible for anyone who builds the same revision from the same sources.
> +# The default value of SOURCE_DATE_EPOCH comes from the function
> +# get_source_date_epoch_value which reads from the SDE_FILE, or if the file
> +# is not available (or set to 0) will use the fallback of
> +# SOURCE_DATE_EPOCH_FALLBACK.
> +#
> +# The SDE_FILE is normally constructed from the function
> +# create_source_date_epoch_stamp which is typically added as a postfuncs to
> +# the do_unpack task.  If a recipe does NOT have do_unpack, it should be added
> +# to a task that runs after the source is available and before the
> +# do_deploy_source_date_epoch task is executed.
> +#
> +# If a recipe wishes to override the default behavior it should set it's own
> +# SOURCE_DATE_EPOCH or override the do_deploy_source_date_epoch_stamp task
> +# with recipe-specific functionality to write the appropriate
> +# SOURCE_DATE_EPOCH into the SDE_FILE.
> +#
> +# SOURCE_DATE_EPOCH is intended to be a reproducible value.  This value should
> +# be reproducible for anyone who builds the same revision from the same
> +# sources.
>   #
> -# There are 4 ways we determine SOURCE_DATE_EPOCH:
> +# There are 4 ways the create_source_date_epoch_stamp function determines what
> +# becomes SOURCE_DATE_EPOCH:
>   #
>   # 1. Use the value from __source_date_epoch.txt file if this file exists.
> -#    This file was most likely created in the previous build by one of the following methods 2,3,4.
> +#    This file was most likely created in the previous build by one of the
> +#    following methods 2,3,4.
>   #    Alternatively, it can be provided by a recipe via SRC_URI.
>   #
>   # If the file does not exist:
> @@ -22,20 +43,16 @@
>   # 3. Use the mtime of "known" files such as NEWS, CHANGLELOG, ...
>   #    This works for well-kept repositories distributed via tarball.
>   #
> -# 4. Use the modification time of the youngest file in the source tree, if there is one.
> +# 4. Use the modification time of the youngest file in the source tree, if
> +#    there is one.
>   #    This will be the newest file from the distribution tarball, if any.
>   #
> -# 5. Fall back to a fixed timestamp.
> +# 5. Fall back to a fixed timestamp (SOURCE_DATE_EPOCH_FALLBACK).
>   #
> -# Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe's SDE_FILE.
> -# If none of these mechanisms are suitable, replace the do_deploy_source_date_epoch task
> -# with recipe-specific functionality to write the appropriate SOURCE_DATE_EPOCH into the SDE_FILE.
> -#
> -# If this file is found by other tasks, the value is exported in the SOURCE_DATE_EPOCH variable.
> -# SOURCE_DATE_EPOCH is set for all tasks that might use it (do_configure, do_compile, do_package, ...)
> +# Once the value is determined, it is stored in the recipe's SDE_FILE.
>   
>   BUILD_REPRODUCIBLE_BINARIES ??= '1'
> -inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'reproducible_build_simple', '')}
> +inherit reproducible_build_simple
>   
>   SDE_DIR = "${WORKDIR}/source-date-epoch"
>   SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
> @@ -92,6 +109,9 @@ python create_source_date_epoch_stamp() {
>       os.rename(tmp_file, epochfile)
>   }
>   
> +# Generate the stamp after do_unpack runs
> +do_unpack[postfuncs] += "create_source_date_epoch_stamp"
> +
>   def get_source_date_epoch_value(d):
>       cached = d.getVar('__CACHED_SOURCE_DATE_EPOCH')
>       if cached:
> @@ -120,8 +140,3 @@ def get_source_date_epoch_value(d):
>   
>   export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
>   BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
> -
> -python () {
> -    if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
> -        d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
> -}


Tidy. Nice to delete some bewilderment.


--------------C657E41F55B10D2D930C4E85
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 10/09/21 1:29 pm, Mark Hatle wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210910012901.19993-2-mark.hatle@kernel.crashing.org">
      <pre class="moz-quote-pre" wrap="">From: Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@xilinx.com">&lt;mark.hatle@xilinx.com&gt;</a>

Previously if BUILD_REPRODUCIBLE_BINARIES was set to 0, the system would
fall back and select the default epoch (April 2011), but still perform
the reproducible build actions.  This resulted in binaries that had an
unusually old date.

Simplify the functions and remove the anonymous python as no longer
necessary.

Also improve the documentation to better explain what the class is doing
and how a recipe can override the behavior if necessary.

Signed-off-by: Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@xilinx.com">&lt;mark.hatle@xilinx.com&gt;</a>
Signed-off-by: Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@kernel.crashing.org">&lt;mark.hatle@kernel.crashing.org&gt;</a>
---
 meta/classes/reproducible_build.bbclass | 53 ++++++++++++++++---------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 378121903d..96bb012243 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -1,17 +1,38 @@
 # reproducible_build.bbclass
 #
-# Sets SOURCE_DATE_EPOCH in each component's build environment.
+# Sets the default SOURCE_DATE_EPOCH in each component's build environment.
+# The format is number of seconds since the system epoch.
+#
 # Upstream components (generally) respect this environment variable,
 # using it in place of the "current" date and time.
 # See <a class="moz-txt-link-freetext" href="https://reproducible-builds.org/specs/source-date-epoch/">https://reproducible-builds.org/specs/source-date-epoch/</a>
 #
-# After sources are unpacked but before they are patched, we set a reproducible value for SOURCE_DATE_EPOCH.
-# This value should be reproducible for anyone who builds the same revision from the same sources.
+# The default value of SOURCE_DATE_EPOCH comes from the function
+# get_source_date_epoch_value which reads from the SDE_FILE, or if the file
+# is not available (or set to 0) will use the fallback of
+# SOURCE_DATE_EPOCH_FALLBACK.
+#
+# The SDE_FILE is normally constructed from the function
+# create_source_date_epoch_stamp which is typically added as a postfuncs to
+# the do_unpack task.  If a recipe does NOT have do_unpack, it should be added
+# to a task that runs after the source is available and before the
+# do_deploy_source_date_epoch task is executed.
+#
+# If a recipe wishes to override the default behavior it should set it's own
+# SOURCE_DATE_EPOCH or override the do_deploy_source_date_epoch_stamp task
+# with recipe-specific functionality to write the appropriate
+# SOURCE_DATE_EPOCH into the SDE_FILE.
+#
+# SOURCE_DATE_EPOCH is intended to be a reproducible value.  This value should
+# be reproducible for anyone who builds the same revision from the same
+# sources.
 #
-# There are 4 ways we determine SOURCE_DATE_EPOCH:
+# There are 4 ways the create_source_date_epoch_stamp function determines what
+# becomes SOURCE_DATE_EPOCH:
 #
 # 1. Use the value from __source_date_epoch.txt file if this file exists.
-#    This file was most likely created in the previous build by one of the following methods 2,3,4.
+#    This file was most likely created in the previous build by one of the
+#    following methods 2,3,4.
 #    Alternatively, it can be provided by a recipe via SRC_URI.
 #
 # If the file does not exist:
@@ -22,20 +43,16 @@
 # 3. Use the mtime of "known" files such as NEWS, CHANGLELOG, ...
 #    This works for well-kept repositories distributed via tarball.
 #
-# 4. Use the modification time of the youngest file in the source tree, if there is one.
+# 4. Use the modification time of the youngest file in the source tree, if
+#    there is one.
 #    This will be the newest file from the distribution tarball, if any.
 #
-# 5. Fall back to a fixed timestamp.
+# 5. Fall back to a fixed timestamp (SOURCE_DATE_EPOCH_FALLBACK).
 #
-# Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe's SDE_FILE.
-# If none of these mechanisms are suitable, replace the do_deploy_source_date_epoch task
-# with recipe-specific functionality to write the appropriate SOURCE_DATE_EPOCH into the SDE_FILE.
-#
-# If this file is found by other tasks, the value is exported in the SOURCE_DATE_EPOCH variable.
-# SOURCE_DATE_EPOCH is set for all tasks that might use it (do_configure, do_compile, do_package, ...)
+# Once the value is determined, it is stored in the recipe's SDE_FILE.
 
 BUILD_REPRODUCIBLE_BINARIES ??= '1'
-inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'reproducible_build_simple', '')}
+inherit reproducible_build_simple
 
 SDE_DIR = "${WORKDIR}/source-date-epoch"
 SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt<a class="moz-txt-link-rfc2396E" href="mailto:@@-92,6+109,9@@pythoncreate_source_date_epoch_stamp(){os.rename(tmp_file,epochfile)}+#Generatethestampafterdo_unpackruns+do_unpack[postfuncs]+=">"
@@ -92,6 +109,9 @@ python create_source_date_epoch_stamp() {
     os.rename(tmp_file, epochfile)
 }
 
+# Generate the stamp after do_unpack runs
+do_unpack[postfuncs] += "</a>create_source_date_epoch_stamp"
+
 def get_source_date_epoch_value(d):
     cached = d.getVar('__CACHED_SOURCE_DATE_EPOCH')
     if cached:
@@ -120,8 +140,3 @@ def get_source_date_epoch_value(d):
 
 export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
 BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
-
-python () {
-    if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
-        d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
-}</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Tidy. Nice to delete some bewilderment.<br>
    </p>
  </body>
</html>

--------------C657E41F55B10D2D930C4E85--
