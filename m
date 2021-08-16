Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.28250.1629138124382241082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 11:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=F7Atztbu;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: abeltran@linux.microsoft.com)
Received: from [192.168.0.237] (unknown [64.187.161.254])
	by linux.microsoft.com (Postfix) with ESMTPSA id A8AB920C29E7;
	Mon, 16 Aug 2021 11:22:03 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A8AB920C29E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1629138123;
	bh=D3Sv1iakHYAbBQ4i5HiiHbYP0Xdwni3UHDtkiaLRPS8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=F7AtztbuwxSMeFYOW+899ODjoOlsPIeY1eGge6+mo7UotMJLAi1OvSL0/bTBcI6P3
	 dbo64thBQMulI0KVHcthH9VJdjdM7GUXUnx16x2NOP+bckqZ8VoSVKdubHLzSWuTSS
	 yGtu4DmUZB5uo1KUPkMWmPr/zyhudxNN5LVO/p6s=
Subject: Re: [OE-core] [PATCH] buildhistory: Add output file listing package information
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: openembedded-core@lists.openembedded.org
References: <20210812165856.6469-1-abeltran@linux.microsoft.com>
 <YRYhfdR5SNZpiYpN@korppu>
From: "Andres Beltran" <abeltran@linux.microsoft.com>
Message-ID: <bf2e46cf-923d-dccb-01ed-c6dd20180578@linux.microsoft.com>
Date: Mon, 16 Aug 2021 11:22:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YRYhfdR5SNZpiYpN@korppu>
Content-Type: multipart/alternative;
 boundary="------------7754B143C4EAB20DDA5F15E8"
Content-Language: en-US

--------------7754B143C4EAB20DDA5F15E8
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mikko,

This patch outputs information that is readily available in the context 
of the
image, i.e. information that can be read directly from pkgdata. The 
information
for the recipe's layer is not readily available, so it would have
to be a separate task to add that information (or make it extensible to 
allow
it).

Best,
-Andres


On 8/13/2021 12:38 AM, Mikko Rapeli wrote:
> Hi,
>
> On Thu, Aug 12, 2021 at 04:58:56PM +0000, Andres Beltran wrote:
>> Currently, buildhistory does not produce a single file combining relevant
>> information of installed packages. Produce an output file
>> "installed-package-info.txt" listing a package's runtime name, buildtime name,
>> its recipe, version, and size to avoid having to look up each package externally.
>> Leave the existing package list files as-is for backwards compatibility.
> Thanks for this patch, I find it useful!
>
> I have had similar needs and have created scripts which parse the same info
> from buildhistory. What I'd add here is the layer of the recipe.
>
> In large projects I have the need to also map binary packages into
> their maintainers and subprojects, and produce reports, e.g. rootfs usage
> reports per maintainer/subproject to be checked against an agreed budget.
> Thus I've used layer and MAINTAINER fields to map binary package to the
> subprojects and maintainers inside the projects.
>
> Would be nice to be able to extend the rootfs binary package reports with
> this info but a bit of scripting on the buildhistory output is fine too.
>
> Cheers,
>
> -Mikko
>
>> In order to support this efficiently, extend oe-pkgdata-util to accept multiple keys
>> for its read-value argument.
>>
>> Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
>> ---
>>   meta/classes/buildhistory.bbclass |  5 +++++
>>   scripts/oe-pkgdata-util           | 37 +++++++++++++++++++------------
>>   2 files changed, 28 insertions(+), 14 deletions(-)
>>
>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
>> index 8a1359acbe..134b56ab71 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -491,6 +491,11 @@ buildhistory_get_installed() {
>>   	cat $1/installed-package-sizes.tmp | awk '{print $2 "\tKiB\t" $1}' | sort -n -r > $1/installed-package-sizes.txt
>>   	rm $1/installed-package-sizes.tmp
>>   
>> +	# Produce package info: runtime_name, buildtime_name, recipe, version, size
>> +	oe-pkgdata-util -p ${PKGDATA_DIR} read-value "PACKAGE,PN,PV,PKGSIZE" -n -f $pkgcache > $1/installed-package-info.tmp
>> +	cat $1/installed-package-info.tmp | sort -n -r -k 5 > $1/installed-package-info.txt
>> +	rm $1/installed-package-info.tmp
>> +
>>   	# We're now done with the cache, delete it
>>   	rm $pkgcache
>>   
>> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
>> index 75dd23efa3..c30baaa580 100755
>> --- a/scripts/oe-pkgdata-util
>> +++ b/scripts/oe-pkgdata-util
>> @@ -171,7 +171,7 @@ def read_value(args):
>>                       val = line.split(': ', 1)[1].rstrip()
>>           return val
>>   
>> -    logger.debug("read-value('%s', '%s' '%s')" % (args.pkgdata_dir, args.valuename, packages))
>> +    logger.debug("read-value('%s', '%s' '%s')" % (args.pkgdata_dir, args.valuenames, packages))
>>       for package in packages:
>>           pkg_split = package.split('_')
>>           pkg_name = pkg_split[0]
>> @@ -180,20 +180,29 @@ def read_value(args):
>>           logger.debug(revlink)
>>           if os.path.exists(revlink):
>>               mappedpkg = os.path.basename(os.readlink(revlink))
>> -            qvar = args.valuename
>> -            value = readvar(revlink, qvar, mappedpkg)
>> -            if qvar == "PKGSIZE":
>> -                # PKGSIZE is now in bytes, but we we want it in KB
>> -                pkgsize = (int(value) + 1024 // 2) // 1024
>> -                value = "%d" % pkgsize
>> -            if args.unescape:
>> -                import codecs
>> -                # escape_decode() unescapes backslash encodings in byte streams
>> -                value = codecs.escape_decode(bytes(value, "utf-8"))[0].decode("utf-8")
>> +            qvars = args.valuenames
>> +            val_names = qvars.split(',')
>> +            values = []
>> +            for qvar in val_names:
>> +                if qvar == "PACKAGE":
>> +                    value = mappedpkg
>> +                else:
>> +                    value = readvar(revlink, qvar, mappedpkg)
>> +                if qvar == "PKGSIZE":
>> +                    # PKGSIZE is now in bytes, but we we want it in KB
>> +                    pkgsize = (int(value) + 1024 // 2) // 1024
>> +                    value = "%d" % pkgsize
>> +                if args.unescape:
>> +                    import codecs
>> +                    # escape_decode() unescapes backslash encodings in byte streams
>> +                    value = codecs.escape_decode(bytes(value, "utf-8"))[0].decode("utf-8")
>> +                values.append(value)
>> +
>> +            values_str = ' '.join(values)
>>               if args.prefix_name:
>> -                print('%s %s' % (pkg_name, value))
>> +                print('%s %s' % (pkg_name, values_str))
>>               else:
>> -                print(value)
>> +                print(values_str)
>>           else:
>>               logger.debug("revlink %s does not exist", revlink)
>>   
>> @@ -570,7 +579,7 @@ def main():
>>       parser_read_value = subparsers.add_parser('read-value',
>>                                             help='Read any pkgdata value for one or more packages',
>>                                             description='Reads the named value from the pkgdata files for the specified packages')
>> -    parser_read_value.add_argument('valuename', help='Name of the value to look up')
>> +    parser_read_value.add_argument('valuenames', help='Name of the value/s to look up (separated by commas, no spaces)')
>>       parser_read_value.add_argument('pkg', nargs='*', help='Runtime package name to look up')
>>       parser_read_value.add_argument('-f', '--file', help='Read package names from the specified file (one per line, first field only)')
>>       parser_read_value.add_argument('-n', '--prefix-name', help='Prefix output with package name', action='store_true')
>> -- 
>> 2.17.1
>>
>>
>>
>>
>> 
>>

--------------7754B143C4EAB20DDA5F15E8
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <font face="monospace">Hi Mikko,<br>
      <br>
      This patch outputs information that is readily available in the
      context of the<br>
      image, i.e. information that can be read directly from pkgdata.
      The information<br>
      for the recipe's layer is not readily available, so it would have<br>
      to be a separate task to add that information (or make it
      extensible to allow<br>
      it).<br>
      <br>
      Best,<br>
      -Andres</font><br>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/13/2021 12:38 AM, Mikko Rapeli
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YRYhfdR5SNZpiYpN@korppu">
      <pre class="moz-quote-pre" wrap="">Hi,

On Thu, Aug 12, 2021 at 04:58:56PM +0000, Andres Beltran wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Currently, buildhistory does not produce a single file combining relevant
information of installed packages. Produce an output file
"installed-package-info.txt" listing a package's runtime name, buildtime name,
its recipe, version, and size to avoid having to look up each package externally.
Leave the existing package list files as-is for backwards compatibility.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks for this patch, I find it useful!

I have had similar needs and have created scripts which parse the same info
from buildhistory. What I'd add here is the layer of the recipe.

In large projects I have the need to also map binary packages into
their maintainers and subprojects, and produce reports, e.g. rootfs usage
reports per maintainer/subproject to be checked against an agreed budget.
Thus I've used layer and MAINTAINER fields to map binary package to the
subprojects and maintainers inside the projects.

Would be nice to be able to extend the rootfs binary package reports with
this info but a bit of scripting on the buildhistory output is fine too.

Cheers,

-Mikko

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In order to support this efficiently, extend oe-pkgdata-util to accept multiple keys
for its read-value argument.

Signed-off-by: Andres Beltran <a class="moz-txt-link-rfc2396E" href="mailto:abeltran@linux.microsoft.com">&lt;abeltran@linux.microsoft.com&gt;</a>
---
 meta/classes/buildhistory.bbclass |  5 +++++
 scripts/oe-pkgdata-util           | 37 +++++++++++++++++++------------
 2 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8a1359acbe..134b56ab71 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -491,6 +491,11 @@ buildhistory_get_installed() {
 	cat $1/installed-package-sizes.tmp | awk '{print $2 "\tKiB\t" $1}' | sort -n -r &gt; $1/installed-package-sizes.txt
 	rm $1/installed-package-sizes.tmp
 
+	# Produce package info: runtime_name, buildtime_name, recipe, version, size
+	oe-pkgdata-util -p ${PKGDATA_DIR} read-value "PACKAGE,PN,PV,PKGSIZE" -n -f $pkgcache &gt; $1/installed-package-info.tmp
+	cat $1/installed-package-info.tmp | sort -n -r -k 5 &gt; $1/installed-package-info.txt
+	rm $1/installed-package-info.tmp
+
 	# We're now done with the cache, delete it
 	rm $pkgcache
 
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 75dd23efa3..c30baaa580 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -171,7 +171,7 @@ def read_value(args):
                     val = line.split(': ', 1)[1].rstrip()
         return val
 
-    logger.debug("read-value('%s', '%s' '%s')" % (args.pkgdata_dir, args.valuename, packages))
+    logger.debug("read-value('%s', '%s' '%s')" % (args.pkgdata_dir, args.valuenames, packages))
     for package in packages:
         pkg_split = package.split('_')
         pkg_name = pkg_split[0]
@@ -180,20 +180,29 @@ def read_value(args):
         logger.debug(revlink)
         if os.path.exists(revlink):
             mappedpkg = os.path.basename(os.readlink(revlink))
-            qvar = args.valuename
-            value = readvar(revlink, qvar, mappedpkg)
-            if qvar == "PKGSIZE":
-                # PKGSIZE is now in bytes, but we we want it in KB
-                pkgsize = (int(value) + 1024 // 2) // 1024
-                value = "%d" % pkgsize
-            if args.unescape:
-                import codecs
-                # escape_decode() unescapes backslash encodings in byte streams
-                value = codecs.escape_decode(bytes(value, "utf-8"))[0].decode("utf-8")
+            qvars = args.valuenames
+            val_names = qvars.split(',')
+            values = []
+            for qvar in val_names:
+                if qvar == "PACKAGE":
+                    value = mappedpkg
+                else:
+                    value = readvar(revlink, qvar, mappedpkg)
+                if qvar == "PKGSIZE":
+                    # PKGSIZE is now in bytes, but we we want it in KB
+                    pkgsize = (int(value) + 1024 // 2) // 1024
+                    value = "%d" % pkgsize
+                if args.unescape:
+                    import codecs
+                    # escape_decode() unescapes backslash encodings in byte streams
+                    value = codecs.escape_decode(bytes(value, "utf-8"))[0].decode("utf-8")
+                values.append(value)
+
+            values_str = ' '.join(values)
             if args.prefix_name:
-                print('%s %s' % (pkg_name, value))
+                print('%s %s' % (pkg_name, values_str))
             else:
-                print(value)
+                print(values_str)
         else:
             logger.debug("revlink %s does not exist", revlink)
 
@@ -570,7 +579,7 @@ def main():
     parser_read_value = subparsers.add_parser('read-value',
                                           help='Read any pkgdata value for one or more packages',
                                           description='Reads the named value from the pkgdata files for the specified packages')
-    parser_read_value.add_argument('valuename', help='Name of the value to look up')
+    parser_read_value.add_argument('valuenames', help='Name of the value/s to look up (separated by commas, no spaces)')
     parser_read_value.add_argument('pkg', nargs='*', help='Runtime package name to look up')
     parser_read_value.add_argument('-f', '--file', help='Read package names from the specified file (one per line, first field only)')
     parser_read_value.add_argument('-n', '--prefix-name', help='Prefix output with package name', action='store_true')
-- 
2.17.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">


</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------7754B143C4EAB20DDA5F15E8--
