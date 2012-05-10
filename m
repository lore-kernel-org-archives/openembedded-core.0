Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SSH1X-0003rK-4C
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:14:27 +0200
Received: by wgbdr1 with SMTP id dr1so764893wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 17:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=cSDeyHsJr+/4+Lhstl3kutWB8RMuW0/FAx0AWTpn7b0=;
	b=gHxrC9cWdE9c7JlZE7v+nE3ndqwB1IX8wwKoxHj9hDvbRTTRG8cIFvb4pQnOOLa2mJ
	TtX6GLu5o62JcJdO2DEVYU5cG6Nu/OJuzbc1le70izKnaDaYjnyx8kQwxh1aXinISzgh
	Z4Yms7viLcyj0QqKrobegNvN46ulMUt0LQSDFgtykHWYjf2hJzMkh/Z5vp1RbnRaWQNa
	VqO4OIHW4vZ4Hh+PJdg5ZnKP9D+A4x9hmIUcEvDmX6FJ0/999FnaiOuaFtshww7pE4x7
	iEXhTIyAaY/KeLSxhmIrKRfBGNgLIXK5JZ9GSS0aD9JI8UhtjuzOmvVlNZEIR1wY30vR
	2yEQ==
Received: by 10.216.195.10 with SMTP id o10mr166743wen.11.1336608273866; Wed,
	09 May 2012 17:04:33 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.181.16 with HTTP; Wed, 9 May 2012 17:03:07 -0700 (PDT)
In-Reply-To: <1336607861.2494.113.camel@ted>
References: <1336607861.2494.113.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 9 May 2012 17:03:07 -0700
X-Google-Sender-Auth: fdsqjG1hmAsjmqwE9OOa-KTnnPs
Message-ID: <CABcZANkdKjrx6hdYGLbjsxO-yfFQxZXXcTOuTfa-Xqh2c0VmgA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bitbake/runqueue: Fix 'full' stamp checking to be more efficient and cache results
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
X-List-Received-Date: Thu, 10 May 2012 00:14:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 4:57 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
> index b870caf..48433be 100644
> --- a/bitbake/lib/bb/runqueue.py
> +++ b/bitbake/lib/bb/runqueue.py
> @@ -875,7 +875,7 @@ class RunQueue:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.msg.fatal("RunQueue", "check=
_stamps fatal internal error")
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return current
>
> - =C2=A0 =C2=A0def check_stamp_task(self, task, taskname =3D None, recurs=
e =3D False):
> + =C2=A0 =C2=A0def check_stamp_task(self, task, taskname =3D None, recurs=
e =3D False, cache =3D {}):

When people do this, it's typically a bug, but I presume you're doing
it intentionally here? Use of mutable default values is often
problematic due to their being shared across all calls to that
function, but that's okay for a cache. Maybe you intended this, given
it's a cache, but I wanted to ensure it was a conscious choice. Also,
this adds yet another global cache with no form of invalidation /
clear at all, it'll continue to grow through the lifetime of the
process.
--=20
Christopher Larson


