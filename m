Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 91CC96C257
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 11:06:52 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id k206-v6so17514668ite.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 03:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VNsCbwC6qKVifNdy/hBzBanf+CEY8EsVoNPe3hbFyII=;
	b=l5o/Walo78VCJ6iQgRVijrUSt6ZnVlLnJhNIB/7hV1Rix99knuLbH6cqZPaxL/lVEN
	Ybe4gAtwjLIzR6N013zEz/mO52AYgyTQZs2dqEwgOPVDO+qDVG2hFfy7GULdrRSacM2V
	Z700LuD5/zJVZRAnWIpMRTkW5PmFRxk6K6B2EDreXRWwtIDorga0wLfy+LYxD/69h6aL
	wAnY5SVlXsRPF3knA7LlsBar29xrfZI27CjsnfWEBqL/sk7e7vukpGSMHZbJkY/NSGjN
	uG2fASvlGu1j7OTX3H7aWKl6ZV9D9so/guhHtF87bPyk6clvU1Ki5eASGiRtqA+YQCxC
	Vr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VNsCbwC6qKVifNdy/hBzBanf+CEY8EsVoNPe3hbFyII=;
	b=nNuCC7nQR7MeqCLD1hOh/IsOU79A7SFL4pTIzhtnmY/vzIXLJzvih6qAW5lQ3G8dC5
	WGF1x231/ZJ5CL2wnufgQ6qKf3KEMz9SB4x4lxxmoIiYJqNDjRmxQuGOD0G9RWnonF1A
	pL3qz2wPfaX5cJqM9dklKryzNw/J/74Qnflfrxq+D2cbYjfb/DVgzS+lw/a2He1zU9sR
	u6la+gvW34C0Ot+xGCUFvWLgqddfGflO9L8acOkvxDfMZ7PxzQ6L4s2WS0ucebrY8Lug
	XY3uvrqLC4+pcETDAcZHUTmGDsCNgGqBV+j2UWYRbxYxiH0YSR72iGlF0icnjCsPKgf8
	7pjg==
X-Gm-Message-State: AGRZ1gJx8QD4AazI1LXEILwHVj6H12yU9IkcOK6zNRwOGDtB3QIpWbEb
	e795TMF7mImyLsI2IgTsx39Pp0+wT9lNTIeFbjcIOw==
X-Google-Smtp-Source: AJdET5f8ABaZkCnrMfHN4VrFPCr8p0L0EsEy+/CDP4RvNF2t4RfRWsrKrTCd7bkLnvlG8EMxuMYFwhMxAolVLWTMpwE=
X-Received: by 2002:a24:ce45:: with SMTP id
	v66-v6mr2940779itg.26.1542107213531; 
	Tue, 13 Nov 2018 03:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20181113101729.19289-1-schnitzeltony@gmail.com>
In-Reply-To: <20181113101729.19289-1-schnitzeltony@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Nov 2018 11:06:42 +0000
Message-ID: <CAJTo0LZmNVBXU+tNYczEqM1C_ed6J1WCeR7--Fda5Xaub8hknA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] scons.bbclass: Force rebuild if necessary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2018 11:06:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This make me look at scons a bit closer, somewhat in shock that it
doesn't have a native way of doing out of tree builds.  Apparently
abusing the repository argument will sometimes work for out of tree
(so you could just put B=3D$WORKDIR/build and add B to [cleandirs]) but
abusing sounds like 'doesn't always work' to me.

I then discovered that the one recipe in oe-core that uses scons
doesn't in fact use the class, and switching to it breaks because
there's no standard way of passing install paths (serf tries to
install to /usr on the host).

So how is your experience with the scons class? Is it actually useful?

Ross
On Tue, 13 Nov 2018 at 10:18, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta/classes/scons.bbclass | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
> index b9ae19d582..286843f74c 100644
> --- a/meta/classes/scons.bbclass
> +++ b/meta/classes/scons.bbclass
> @@ -2,7 +2,16 @@ DEPENDS +=3D "python-scons-native"
>
>  EXTRA_OESCONS ?=3D ""
>
> -do_configure[noexec] =3D "1"
> +do_configure() {
> +       if [ -n "${CONFIGURESTAMPFILE}" ]; then
> +               if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMP=
FILE}`" !=3D "${BB_TASKHASH}" -a "${CLEANBROKEN}" !=3D "1" ]; then
> +                       ${STAGING_BINDIR_NATIVE}/scons --clean PREFIX=3D$=
{prefix} prefix=3D${prefix} ${EXTRA_OESCONS}
> +               fi
> +
> +               mkdir -p `dirname ${CONFIGURESTAMPFILE}`
> +               echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
> +       fi
> +}
>
>  scons_do_compile() {
>          ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=3D${prefi=
x} prefix=3D${prefix} ${EXTRA_OESCONS} || \
> --
> 2.14.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

