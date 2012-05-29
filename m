Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SZQPw-0001pb-Uw
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 19:41:13 +0200
Received: by wgbdr1 with SMTP id dr1so3780405wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=NcJIRm9XjEL/AV6FUX2+4OsBML3UnBdS6HrYsoDifwU=;
	b=QHIDAq5eMr5ZRnxQLUO5fJe0hbjKj8yIgO/apPXVkvtk3xej/iG8XKr+GffQGwT0eG
	vfKSJ8MLDXoX2nOvgbKXOPyey/3Z9BbBIk+M395G7nT31D7fqDK83BG97PPHLgBAVNac
	I55nis2qaWa/1cERC7utmaPA1ZwXxH3cNgUgJ74DyrbguewAEFDQVCjrN/8gWwX/SNlG
	3hBCjzpWR8C+aYpSsdbopAP7bhJ9BYN1nQRupXcveZeccJjfsY6kmu/b0NY20FH0bpky
	pXzX+2H8XHimCJlBn1F9KSEZ5MilzwyoPQEK5iK64Jqbo1FuejIrMEYJAg6IS76lNH2T
	k71A==
Received: by 10.216.209.159 with SMTP id s31mr25169weo.86.1338312655405; Tue,
	29 May 2012 10:30:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.181.16 with HTTP; Tue, 29 May 2012 10:30:34 -0700 (PDT)
In-Reply-To: <17015f5456a8216f84817ef9183b83779537347d.1338302685.git.liezhi.yang@windriver.com>
References: <cover.1338302685.git.liezhi.yang@windriver.com>
	<17015f5456a8216f84817ef9183b83779537347d.1338302685.git.liezhi.yang@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 29 May 2012 10:30:34 -0700
X-Google-Sender-Auth: i5R0zDUM4pWA16GHbD6w-OAo1Ss
Message-ID: <CABcZANmqC4JZgJ6bMq+JNfQAoirngBxY_bSch+Ae=s4o48pqqQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 4/4] scripts: replace os.popen with subprocess.Popen
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2012 17:41:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 29, 2012 at 7:53 AM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
> Replace os.popen with subprocess.Popen since the older function would
> fail (more or less) silently if the executed program cannot be found
>
> More info:
> http://docs.python.org/library/subprocess.html#subprocess-replacements
>
> [YOCTO #2454]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> =C2=A0scripts/contrib/python/generate-manifest-2.7.py | =C2=A0 =C2=A03 ++=
-
> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/co=
ntrib/python/generate-manifest-2.7.py
> index 7b43137..d139ab1 100755
> --- a/scripts/contrib/python/generate-manifest-2.7.py
> +++ b/scripts/contrib/python/generate-manifest-2.7.py
> @@ -13,6 +13,7 @@
> =C2=A0import os
> =C2=A0import sys
> =C2=A0import time
> +import subprocess
>
> =C2=A0VERSION =3D "2.7.2"
>
> @@ -149,7 +150,7 @@ class MakefileMaker:
> =C2=A0if __name__ =3D=3D "__main__":
>
> =C2=A0 =C2=A0 if len( sys.argv ) > 1:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0os.popen( "rm -f ./%s" % sys.argv[1] )
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.Popen("rm -f ./%s" % sys.argv[1],=
 shell=3DTrue, stdout=3Dsubprocess.PIPE).stdout
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D file( sys.argv[1], "w" )
> =C2=A0 =C2=A0 else:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D sys.stdout

This seems like a candidate for subprocess.call, not subprocess.Popen,
as the output isn't used. Better yet, just use os.unlink() and ignore
exceptions from it.
--=20
Christopher Larson


