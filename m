Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web09.2754.1631233940716129018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 17:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from [10.200.20.196] (unknown [10.200.20.196])
	by smtp0.taitradio.net (Postfix) with ESMTP id E5E1AE0134;
	Fri, 10 Sep 2021 12:32:18 +1200 (NZST)
Subject: Re: [OE-core][PATCH 2/2] reproducible_build: Work with externalsrc
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
 openembedded-core@lists.openembedded.org
References: <20210909025100.119427-1-mark.hatle@kernel.crashing.org>
 <20210909025100.119427-3-mark.hatle@kernel.crashing.org>
From: "Douglas" <douglas.royds@taitradio.com>
Message-ID: <235933db-29d9-02d1-e5b0-e6fc72715335@taitradio.com>
Date: Fri, 10 Sep 2021 12:32:18 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210909025100.119427-3-mark.hatle@kernel.crashing.org>
Content-Type: multipart/alternative;
 boundary="------------7EA3379F41D2C82293BD8F0C"
Content-Language: en-GB

--------------7EA3379F41D2C82293BD8F0C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/09/21 2:51 pm, Mark Hatle wrote:
> From: Mark Hatle <mark.hatle@xilinx.com>
>
> Externalsrc removes do_fetch, do_unpack, and do_patch.  The system normally
> discovers the correct reproducible date as a postfuncs on do_unpack, so this
> date is never found, so it goes back to the default epoch.
>
> Instead we can move the discovery function to a prefuncs on the epoch
> deploy task.  This task will run before do_configure, and since the source
> is already available can run anytime safely.
>
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>   meta/classes/reproducible_build.bbclass | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
> index a9c117c3b9..ae0723ab21 100644
> --- a/meta/classes/reproducible_build.bbclass
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -128,7 +128,13 @@ BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
>   python () {
>       if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
>           # Generate the timestamp with create_source_date_epoch_stamp.
> -        d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
> +        # In most cases this will be a postfuncs of do_unpack.
> +        # If we're running in external source, add create_source_date_epoch_stamp
> +        # to do_deploy_source_date_epoch instead because there is no do_unpack.
> +        if d.getVar('EXTERNALSRC') and bb.data.inherits_class('externalsrc', d):
> +            d.appendVarFlag('do_deploy_source_date_epoch', 'prefuncs', ' create_source_date_epoch_stamp')
> +        else:
> +            d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
>           d.appendVar('SSTATETASKS', " do_deploy_source_date_epoch")
>           bb.build.addtask('do_deploy_source_date_epoch_setscene', None, None, d)
>           bb.build.addtask('do_deploy_source_date_epoch', 'do_configure', 'do_patch', d)


Why was create_source_date_epoch_stamp ever added as a do_unpack 
postfunc in the first place? Why wasn't it invoked directly from 
do_deploy_source_date_epoch all along? This task runs after do_patch and 
before do_configure anyway. What am I missing? Are you there, Juro?

If we create_source_date_epoch_stamp (either as a 
do_deploy_source_date_epoch prefunc or directly invoked), then it should 
work either way, for externalsrc or not.

As an aside, perhaps do_deploy_source_date_epoch should come after 
do_unpack as well, just in case someone has deleted do_patch:

    addtask do_deploy_source_date_epoch before do_configure after
    do_unpack do_patch


--------------7EA3379F41D2C82293BD8F0C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/09/21 2:51 pm, Mark Hatle wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210909025100.119427-3-mark.hatle@kernel.crashing.org">
      <pre class="moz-quote-pre" wrap="">From: Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@xilinx.com">&lt;mark.hatle@xilinx.com&gt;</a>

Externalsrc removes do_fetch, do_unpack, and do_patch.  The system normally
discovers the correct reproducible date as a postfuncs on do_unpack, so this
date is never found, so it goes back to the default epoch.

Instead we can move the discovery function to a prefuncs on the epoch
deploy task.  This task will run before do_configure, and since the source
is already available can run anytime safely.

Signed-off-by: Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@xilinx.com">&lt;mark.hatle@xilinx.com&gt;</a>
Signed-off-by: Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@kernel.crashing.org">&lt;mark.hatle@kernel.crashing.org&gt;</a>
---
 meta/classes/reproducible_build.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index a9c117c3b9..ae0723ab21 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -128,7 +128,13 @@ BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
 python () {
     if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
         # Generate the timestamp with create_source_date_epoch_stamp.
-        d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
+        # In most cases this will be a postfuncs of do_unpack.
+        # If we're running in external source, add create_source_date_epoch_stamp
+        # to do_deploy_source_date_epoch instead because there is no do_unpack.
+        if d.getVar('EXTERNALSRC') and bb.data.inherits_class('externalsrc', d):
+            d.appendVarFlag('do_deploy_source_date_epoch', 'prefuncs', ' create_source_date_epoch_stamp')
+        else:
+            d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
         d.appendVar('SSTATETASKS', " do_deploy_source_date_epoch")
         bb.build.addtask('do_deploy_source_date_epoch_setscene', None, None, d)
         bb.build.addtask('do_deploy_source_date_epoch', 'do_configure', 'do_patch', d)</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Why was create_source_date_epoch_stamp ever added as a do_unpack
      postfunc in the first place? Why wasn't it invoked directly from
      do_deploy_source_date_epoch all along? This task runs after
      do_patch and before do_configure anyway. What am I missing? Are
      you there, Juro?</p>
    <p>If we create_source_date_epoch_stamp (either as a
      do_deploy_source_date_epoch prefunc or directly invoked), then it
      should work either way, for externalsrc or not.</p>
    <p>As an aside, perhaps do_deploy_source_date_epoch should come
      after do_unpack as well, just in case someone has deleted
      do_patch:<br>
    </p>
    <blockquote>
      <p>addtask do_deploy_source_date_epoch before do_configure after
        do_unpack do_patch</p>
    </blockquote>
  </body>
</html>

--------------7EA3379F41D2C82293BD8F0C--
