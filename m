Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11610.1794484538570134188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 03:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FMBqPHc/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2B4A41A1629;
	Thu, 12 Nov 2026 11:55:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8A1C5FF85;
	Thu, 12 Nov 2026 11:55:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C28E11BC114F;
	Thu, 12 Nov 2026 12:55:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794484535; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZH60y87I5TJ3B6fQ3pqKsErboqe0KpNawqbz/8GUtqA=;
	b=FMBqPHc/pXfy3mtm1q3n4dv0wJgQicDzAxofmsJXl2d/VYMOp50xbNGLznyIehokiAcUdZ
	gImiZefAXh1tuz7IqZ/Hag/L282d+c0CO9HB/6WH/7o3Wk91p2Q+Oz9a4jLWiMk6dPjT7B
	lPYRSWTqYqyBQVWca7NDpSrfTeYpWjI4BOSYkZWf41AtChbNjrSl3p6QJCWNn6BggyGf7w
	wfmBThQUEXiUo7pZP4A4rm+SYNgTnDiivUiCGhNynVYMk9OWDYpHzvLctPINsAHuSCdExV
	BoGwcabsXyI1yn5hQLuNfytfVR517miK7CbRPzHhK6XrmF4fxqZK3ghI1MXyfg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 12:55:33 +0100
Message-Id: <DMT7ODZP29TY.2NAZOQK8HG3Z5@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/6] python3: remove obsolete reformatting
 of _sysconfigdata*.py
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261111141726.1496785-1-ross.burton@arm.com>
In-Reply-To: <20261111141726.1496785-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 11:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250088

On Wed Nov 11, 2026 at 3:17 PM CET, Ross Burton via openembedded-core wrote=
:
> The python3 recipe currently reformats the _sysconfigdata*.py files after
> they are modified to remove build paths, as the files may be wrapped
> differently based on the length of strings[1].
>
> However, this wrapping was due to the use of pprint.pprint(), which
> since Python 3.13 is no longer used to generate the sysconfigdata[2].
>
> As such, remove the reformatting as it is no longer needed.
>
> [1] oe-core ec8a2b310d5 ("python3: Reformat sysconfig")
> [2] python 5ecedbd2669 ("gh-106789: avoid importing pprint from sysconfig=
 (#106790)")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

I'm sorry, but I can see a lot of red:

ERROR: nativesdk-python3-3.14.10-r0 do_package_write_rpm: Execution of '/sr=
v/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-nativesd=
k-pokysdk-linux/nativesdk-python3/3.14.10/temp/run.BUILDSPEC.3120668' faile=
d with exit code 1
...
 Processing files: nativesdk-python3-tests-3.14.10-r0.x86_64_nativesdk
| error: Directory not found: /srv/pokybuild/yocto-worker/genericx86-64/bui=
ld/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.14.10/=
package/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/lib/python3.14/test/__pycache__
| error: Directory not found: /srv/pokybuild/yocto-worker/genericx86-64/bui=
ld/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.14.10/=
package/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/lib/python3.14/test/test_free_threading/__pycache__
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/5022

I can see this on virtually all builds.

I know we had a lot of changes on python3 in the last days, so maybe
this is just conflicting with other changes.

I also note this was tested on yesterday master branch. I know it
conflicts with your other patches merged this morning, so it won't apply
cleanly on master.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

