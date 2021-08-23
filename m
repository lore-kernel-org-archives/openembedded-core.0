Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.27464.1629740440355369957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 10:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=CsVtjiNu;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: abeltran@linux.microsoft.com)
Received: from [192.168.0.237] (unknown [64.187.161.254])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6799820B7192
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 10:40:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6799820B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1629740439;
	bh=nwC601RNDYG4UoMoGP3JLekWlwD3fjiBv/SmJ8E1v3E=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=CsVtjiNu3PDE9i7n2ZcjdF/Q8V/pATh/8v2rFyEaKZBcSINTl7ZB6/zSU3VG5MloF
	 INViCAkMM3oT5MK0e8l9mK3SuXe/vjRKuCDdfvlfx9r5vuSTC77B9vy0XkT1QbFKS+
	 ABGPuWpYciiysCeN/5Um4GOeAUECuExEctpdOOq8=
Subject: Re: [OE-core] [PATCH] buildhistory: Add output file listing package information
To: openembedded-core@lists.openembedded.org
References: <169A9DA42F327D81.28384@lists.openembedded.org>
From: "Andres Beltran" <abeltran@linux.microsoft.com>
Message-ID: <41494860-972e-c58e-4d97-c052e844a0fb@linux.microsoft.com>
Date: Mon, 23 Aug 2021 10:40:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <169A9DA42F327D81.28384@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------A4D82CFDB777AA48DE3B4C6B"
Content-Language: en-US

--------------A4D82CFDB777AA48DE3B4C6B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

This is a reminder request for review.

Best,
Andres Beltran


On 8/12/2021 9:58 AM, Andres Beltran wrote:
> Currently, buildhistory does not produce a single file combining relevant
> information of installed packages. Produce an output file
> "installed-package-info.txt" listing a package's runtime name, buildtime name,
> its recipe, version, and size to avoid having to look up each package externally.
> Leave the existing package list files as-is for backwards compatibility.
>
> In order to support this efficiently, extend oe-pkgdata-util to accept multiple keys
> for its read-value argument.
>
> Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
> ---
>   meta/classes/buildhistory.bbclass |  5 +++++
>   scripts/oe-pkgdata-util           | 37 +++++++++++++++++++------------
>   2 files changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 8a1359acbe..134b56ab71 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -491,6 +491,11 @@ buildhistory_get_installed() {
>   	cat $1/installed-package-sizes.tmp | awk '{print $2 "\tKiB\t" $1}' | sort -n -r > $1/installed-package-sizes.txt
>   	rm $1/installed-package-sizes.tmp
>   
> +	# Produce package info: runtime_name, buildtime_name, recipe, version, size
> +	oe-pkgdata-util -p ${PKGDATA_DIR} read-value "PACKAGE,PN,PV,PKGSIZE" -n -f $pkgcache > $1/installed-package-info.tmp
> +	cat $1/installed-package-info.tmp | sort -n -r -k 5 > $1/installed-package-info.txt
> +	rm $1/installed-package-info.tmp
> +
>   	# We're now done with the cache, delete it
>   	rm $pkgcache
>   
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 75dd23efa3..c30baaa580 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -171,7 +171,7 @@ def read_value(args):
>                       val = line.split(': ', 1)[1].rstrip()
>           return val
>   
> -    logger.debug("read-value('%s', '%s' '%s')" % (args.pkgdata_dir, args.valuename, packages))
> +    logger.debug("read-value('%s', '%s' '%s')" % (args.pkgdata_dir, args.valuenames, packages))
>       for package in packages:
>           pkg_split = package.split('_')
>           pkg_name = pkg_split[0]
> @@ -180,20 +180,29 @@ def read_value(args):
>           logger.debug(revlink)
>           if os.path.exists(revlink):
>               mappedpkg = os.path.basename(os.readlink(revlink))
> -            qvar = args.valuename
> -            value = readvar(revlink, qvar, mappedpkg)
> -            if qvar == "PKGSIZE":
> -                # PKGSIZE is now in bytes, but we we want it in KB
> -                pkgsize = (int(value) + 1024 // 2) // 1024
> -                value = "%d" % pkgsize
> -            if args.unescape:
> -                import codecs
> -                # escape_decode() unescapes backslash encodings in byte streams
> -                value = codecs.escape_decode(bytes(value, "utf-8"))[0].decode("utf-8")
> +            qvars = args.valuenames
> +            val_names = qvars.split(',')
> +            values = []
> +            for qvar in val_names:
> +                if qvar == "PACKAGE":
> +                    value = mappedpkg
> +                else:
> +                    value = readvar(revlink, qvar, mappedpkg)
> +                if qvar == "PKGSIZE":
> +                    # PKGSIZE is now in bytes, but we we want it in KB
> +                    pkgsize = (int(value) + 1024 // 2) // 1024
> +                    value = "%d" % pkgsize
> +                if args.unescape:
> +                    import codecs
> +                    # escape_decode() unescapes backslash encodings in byte streams
> +                    value = codecs.escape_decode(bytes(value, "utf-8"))[0].decode("utf-8")
> +                values.append(value)
> +
> +            values_str = ' '.join(values)
>               if args.prefix_name:
> -                print('%s %s' % (pkg_name, value))
> +                print('%s %s' % (pkg_name, values_str))
>               else:
> -                print(value)
> +                print(values_str)
>           else:
>               logger.debug("revlink %s does not exist", revlink)
>   
> @@ -570,7 +579,7 @@ def main():
>       parser_read_value = subparsers.add_parser('read-value',
>                                             help='Read any pkgdata value for one or more packages',
>                                             description='Reads the named value from the pkgdata files for the specified packages')
> -    parser_read_value.add_argument('valuename', help='Name of the value to look up')
> +    parser_read_value.add_argument('valuenames', help='Name of the value/s to look up (separated by commas, no spaces)')
>       parser_read_value.add_argument('pkg', nargs='*', help='Runtime package name to look up')
>       parser_read_value.add_argument('-f', '--file', help='Read package names from the specified file (one per line, first field only)')
>       parser_read_value.add_argument('-n', '--prefix-name', help='Prefix output with package name', action='store_true')
>
> 
>

--------------A4D82CFDB777AA48DE3B4C6B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello,</p>
    This is a reminder request for review.<br>
    <br>
    Best,<br>
    Andres Beltran
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/2021 9:58 AM, Andres Beltran
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:169A9DA42F327D81.28384@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Currently, buildhistory does not produce a single file combining relevant
information of installed packages. Produce an output file
"installed-package-info.txt" listing a package's runtime name, buildtime name,
its recipe, version, and size to avoid having to look up each package externally.
Leave the existing package list files as-is for backwards compatibility.

In order to support this efficiently, extend oe-pkgdata-util to accept multiple keys
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
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A4D82CFDB777AA48DE3B4C6B--
