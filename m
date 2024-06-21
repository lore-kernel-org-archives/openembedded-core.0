Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0116C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:29:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.69843.1718965744074690747
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dnebKbRh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17EB7C0005;
	Fri, 21 Jun 2024 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718965742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jUnJPvqZ08UBWeBuygL4TrUYOErrV7FV8vpKMhPR7Pc=;
	b=dnebKbRhe1dFY4Vvw8ABOVW/ia/EWJk7r5//56V616yMzgSqTj1ePnLT6pbzL1kYTHL9Bc
	asn+E/E2pwEvdF2RrP4jvvZlYTsNymE2CJGcYXSjEhH567PR9vw6eVcd9mAnWjMPIhpyd7
	Jj/id3WHZLmRMdQADWnwvNK3FYc0BlKXNXYo+DsUpZaHmJj511cFfkzmI9DeM3Br+OGoMn
	W7i7LtlzmDxM8MjZfmxMZ356vS1wEoEIt4mZbUUFq9Kkm8+dyu2cId3qikZXRPwgYH6Ytd
	jC4CA/g2cFIx1pizw2xEDfpdyR/M/K/3GBFUO580dEfiTPVTufvIJT44fZdaqQ==
Content-Type: multipart/alternative;
 boundary="------------BWnFDcQnNEmh0dKXy2YNAEtv"
Message-ID: <2a775a76-43da-4139-ace1-d28e35a66504@bootlin.com>
Date: Fri, 21 Jun 2024 12:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] acl: Fix nfs ptest failure
Content-Language: en-US, fr
To: openembedded-core@lists.openembedded.org
References: <20240619091703.1410186-1-mingli.yu@windriver.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240619091703.1410186-1-mingli.yu@windriver.com>
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201005

This is a multi-part message in MIME format.
--------------BWnFDcQnNEmh0dKXy2YNAEtv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 6/19/24 11:17, Yu, Mingli wrote:
> From: Mingli Yu<mingli.yu@windriver.com>
>
> * The date such as "Jun 13" should take 2 columns, so the expected check
> item "test/sub2" should the column 9.
>   # ls test/sub2 -dl
>   drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
>
>    Corret the check item to fix the below failure in the test/nfsacl.test.
>    [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -- failed
>    drwxr-xr-x 07:23                      != drwxr-xr-x test/sub2
>    -rw-r--r-- 07:23                      != -rw-r--r-- test/sub2/blah
>
> * Use the abosulte path otherwise we won't find the expected file blah.
>
> * The calls to getgrnam_r would always fail because the size of the
> buffer was smaller than the minimum (170000) specified in the test
> implementations of getgrnam_r and getpwnam_r.  Use test_get*_match directly
> because getpwnam and getgrnam should never fail on ERANGE.
>
> This commit fixes the following failure in the test/nfs/nfs-dir.test test:
>
> [16] $ su bin -- failed
> su: user bin does not exist           != ~
>
>   # ./run-ptest
> PASS: test/cp.test
> PASS: test/getfacl-lfs.test
> PASS: test/getfacl-noacl.test
> PASS: test/getfacl-recursive.test
> PASS: test/malformed-restore.test
> PASS: test/misc.test
> PASS: test/sbits-restore.test
> PASS: test/setfacl-X.test
> PASS: test/utf8-filenames.test
> PASS: test/root/getfacl.test
> PASS: test/root/permissions.test
> PASS: test/root/restore.test
> PASS: test/root/setfacl.test
> PASS: test/nfs/nfsacl.test
> PASS: test/nfs/nfs-dir.test
> ============================================================================
> Testsuite summary for acl 2.3.2
> ============================================================================
>   # TOTAL: 15
>   # PASS:  15
>   # SKIP:  0
>   # XFAIL: 0
>   # FAIL:  0
>   # XPASS: 0
>   # ERROR: 0
> ============================================================================
>
> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
> ---

The patch is intended to fix a ptest failure, but could it be causing 
this nfsacl.test failure?

Please, check the following output:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6734/steps/13/logs/stdio

and from the autobuilder logs:

FAIL: test/nfs/nfsacl
=====================

[6] $ umask 022 -- ok
[7] $ mkdir -p test/sub -- ok
[8] $ echo blah > test/sub/blah -- ok
[10] $ cp -rp test/sub test/sub2 -- ok
[11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
[15] $ rm -rf test/sub2 -- ok
[17] $ setfacl -m u:daemon:rwx test/sub -- ok
[18] $ setfacl -dm u:daemon:rwx test/sub -- ok
[19] $ getfattr -m- test/sub -- failed
Can't exec "getfattr": No such file or directory at ./test/run line 369, 
<TEST_FILE> line 24. != # file: test/sub
getfattr: No such file or directory   != system.posix_acl_access
~                                     != system.posix_acl_default
~                                     !=
[25] $ cp -rp test/sub test/sub2 -- ok
[26] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
[30] $ rm -rf test/sub2 -- ok
[32] $ setfacl -m u:daemon:rw test/sub/blah -- ok
[33] $ cp -rp test/sub test/sub2 -- ok
[34] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
[38] $ rm -rf test/sub2 -- ok
[42] $ rm -rf test -- ok
17 commands (16 passed, 1 failed)
FAIL test/nfs/nfsacl.test (exit status: 1)

-- 
Best regards,
João Marcos Costa

--------------BWnFDcQnNEmh0dKXy2YNAEtv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hello,</font><br>
    </p>
    <div class="moz-cite-prefix">On 6/19/24 11:17, Yu, Mingli wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240619091703.1410186-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>

* The date such as "Jun 13" should take 2 columns, so the expected check
item "test/sub2" should the column 9.
 # ls test/sub2 -dl
 drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2

  Corret the check item to fix the below failure in the test/nfsacl.test.
  [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -- failed
  drwxr-xr-x 07:23                      != drwxr-xr-x test/sub2
  -rw-r--r-- 07:23                      != -rw-r--r-- test/sub2/blah

* Use the abosulte path otherwise we won't find the expected file blah.

* The calls to getgrnam_r would always fail because the size of the
buffer was smaller than the minimum (170000) specified in the test
implementations of getgrnam_r and getpwnam_r.  Use test_get*_match directly
because getpwnam and getgrnam should never fail on ERANGE.

This commit fixes the following failure in the test/nfs/nfs-dir.test test:

[16] $ su bin -- failed
su: user bin does not exist           != ~

 # ./run-ptest
PASS: test/cp.test
PASS: test/getfacl-lfs.test
PASS: test/getfacl-noacl.test
PASS: test/getfacl-recursive.test
PASS: test/malformed-restore.test
PASS: test/misc.test
PASS: test/sbits-restore.test
PASS: test/setfacl-X.test
PASS: test/utf8-filenames.test
PASS: test/root/getfacl.test
PASS: test/root/permissions.test
PASS: test/root/restore.test
PASS: test/root/setfacl.test
PASS: test/nfs/nfsacl.test
PASS: test/nfs/nfs-dir.test
============================================================================
Testsuite summary for acl 2.3.2
============================================================================
 # TOTAL: 15
 # PASS:  15
 # SKIP:  0
 # XFAIL: 0
 # FAIL:  0
 # XPASS: 0
 # ERROR: 0
============================================================================

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
---</pre>
    </blockquote>
    <p><font face="monospace">The patch is intended to fix a ptest
        failure, but could it be causing this nfsacl.test failure?</font></p>
    <p><font face="monospace">Please, check the following output:<br>
      </font></p>
    <p><font face="monospace"><a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6734/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6734/steps/13/logs/stdio</a></font></p>
    <p><font face="monospace">and from the autobuilder logs:</font></p>
    <p><font face="monospace">FAIL: test/nfs/nfsacl<br>
        =====================<br>
        <br>
        [6] $ umask 022 -- ok<br>
        [7] $ mkdir -p test/sub -- ok<br>
        [8] $ echo blah &gt; test/sub/blah -- ok<br>
        [10] $ cp -rp test/sub test/sub2 -- ok<br>
        [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print
        $1,$9}' -- ok<br>
        [15] $ rm -rf test/sub2 -- ok<br>
        [17] $ setfacl -m u:daemon:rwx test/sub -- ok<br>
        [18] $ setfacl -dm u:daemon:rwx test/sub -- ok<br>
        [19] $ getfattr -m- test/sub -- failed<br>
        Can't exec "getfattr": No such file or directory at ./test/run
        line 369, &lt;TEST_FILE&gt; line 24. != # file: test/sub<br>
        getfattr: No such file or directory   != system.posix_acl_access<br>
        ~                                     !=
        system.posix_acl_default<br>
        ~                                     != <br>
        [25] $ cp -rp test/sub test/sub2 -- ok<br>
        [26] $ find test/sub2 | sort | xargs ls -dl | awk '{print
        $1,$9}' -- ok<br>
        [30] $ rm -rf test/sub2 -- ok<br>
        [32] $ setfacl -m u:daemon:rw test/sub/blah -- ok<br>
        [33] $ cp -rp test/sub test/sub2 -- ok<br>
        [34] $ find test/sub2 | sort | xargs ls -dl | awk '{print
        $1,$9}' -- ok<br>
        [38] $ rm -rf test/sub2 -- ok<br>
        [42] $ rm -rf test -- ok<br>
        17 commands (16 passed, 1 failed)<br>
        FAIL test/nfs/nfsacl.test (exit status: 1)<br>
        <br>
      </font></p>
    <pre class="moz-signature" cols="72">-- 
Best regards,
João Marcos Costa</pre>
  </body>
</html>

--------------BWnFDcQnNEmh0dKXy2YNAEtv--

