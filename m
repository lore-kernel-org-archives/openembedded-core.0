Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C766DC54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 11:33:13 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4570.1785497586742945638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 04:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Js/2BYHd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69c5fda04a8so1631419a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 04:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785497585; x=1786102385; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AEer02XahBSGCemljXHn/BWoQ6d7XbXE5H4FQ9AV7hQ=;
        b=Js/2BYHdz8ORT4SekevL5aWPcjfo4vJDZZkvVvBQPrq+H/9PksGi7P6dgWJOTkHpin
         ISQyT8zhb8+y4SFa9CYcnuk3nXmjZDZDGQgkYbdC3wTfXKgzGrd8BQM+AeZCSyXx4Tlx
         Cbow22QwCDQODDTBD0G1FFi8fLDSqmAiaTX20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497585; x=1786102385;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEer02XahBSGCemljXHn/BWoQ6d7XbXE5H4FQ9AV7hQ=;
        b=aYUB2wcxWndJlbfFK1L+ql5YZe6VnlY0F4n9H8rgwmWXK/Sy6eZQP7SPtV/V8Qbi1V
         2On5oX6Y4ZxhBPBuhQ8sPIxCaD6f7PPUXoPY0BGHig2nVPdq5AZvoF448J6v3+N1KiEe
         5+zwQ6ZS8kwEYOY+R2ObBSCqxYz06+zEHDI18Xl5XVLy1ooCLfAQSgJGUYc/Jj128Z8U
         zWV6eRS22Uo0JIiG2AWilzhq0WtePCP0Bv5W31Nz73XzEf7yuX7mPmDoZ4UMFEVYtBBw
         KhNdCQm1ildZsvZ6+T1AOMd+thjLaZ5OSX+tD8emWYX42n5n/0FRwGK0mRq6VCV7aktl
         5O+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKMDh0Bq2Kt3F7TDLlvE6B035DQ1GqdjyCMRb7kumwJH4JwOWbdJ41Hr9nta8VZIe4LgDmYb0RhNYTj6czOrbLbw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxX6YCzZWlCR6rRmiiC5Cj5cGDT9CM3kaPAi/Kp7fMDLeNDeoNF
	QOl3sakeQwTrgDS84+TaYDrw9BoLTmRenKUqc3VJATBtx3jbOsUwfDccaC7h4cKsvOc=
X-Gm-Gg: AR+sD13lOqpVS6IHctoPU+Ajdh+Op0Fre3Anjet14AydBLsQR32T/dgaTgUkzep5YVx
	TFGsrqp22VIsGUIgKP0G+GMzQEZHs+257XCFMH6BkSy1R9ma+ELxpRdCEMGIFw0kGNJaYghwT8q
	cgxFgleCnnEBvX363E1h13Xvzm4X92Jz9NGNsb0uq1z49/zVcHSop3brUNi9PBfysSnBuRgrLwo
	IptKiGlNZJ2Ooc/isMSzGKGkzVFalVeSrkIGd1WGfNu/KMzoxQAxuR8BMe1GkSmUaOrn8+eus36
	dh5Dq8B97MoY6XlhvIre4M/PXx69HapDn2wzJ59gKM4PyEoUS0c3126x5aujyEvBeE7OD+Vx8w8
	EGG1fGB1B+UrtHrCuBIAkNuEVF+HUoAIUZHcVmfmBiv6rC3Ty5b6UrtQljgzICRiptsUS2tmrAZ
	M/mfmkrjk9S1ANuvuYOFnE05NMUFkCw4NL8FMLA8Kxs5J6bwCNwiQp0CPJmgUAjiIYD0FE257o9
	gDqMb8fI2uTjtF8K6BvXvbZXhgkHoOnhk82J3j9384kTaQ2nUUy1Q==
X-Received: by 2002:a05:6402:43cc:b0:69a:a03a:70d4 with SMTP id 4fb4d7f45d1cf-6a098cfc337mr773342a12.23.1785497584883;
        Fri, 31 Jul 2026 04:33:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f7b:46f5:a0f7:875c? ([2001:8b0:aba:5f3c:7f7b:46f5:a0f7:875c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c63d9d6sm1523081a12.17.2026.07.31.04.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:33:03 -0700 (PDT)
Message-ID: <91a379303efff1db910d183838dabd37d795fe58.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] glib-2.0,glib-2.0-initial: upgrade 2.88.2
 -> 2.88.3,2.88.2 -> 2.88.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2026 12:33:03 +0100
In-Reply-To: <20260731103522.81637-1-jaipaul.cheernam@est.tech>
References: <20260730124721.33400-1-jaipaul.cheernam@est.tech>
	 <20260731103522.81637-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 11:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242430

On Fri, 2026-07-31 at 12:35 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> Changelog: https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.3/NEWS#L1-L17
>=20
> Source: NEWS
>=20
> Overview of changes in GLib 2.88.3, 2026-07-29
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Fix potential miscompilation with GCC 17 with G_GNUC_CONST on get_type(=
)
> =C2=A0 functions (#3984, work by Sam James)
>=20
> * Bugs fixed:
> =C2=A0 - #3984 G_GNUC_CONST vs get_type comes home to roost (Sam James)
> =C2=A0 - #3985 (CVE-2026-15588) Security report: GDBusServer pre-authenti=
cation DoS
> =C2=A0=C2=A0=C2=A0 via unbounded SASL line buffering (Philip Withnall)
> =C2=A0 - !5225 Backport !5223 "Drop G_GNUC_CONST for *_get_type" to glib-=
2-88
> =C2=A0 - !5241 Backport !5240 "gdbusauth: Limit length of lines read from=
 client" to
> =C2=A0=C2=A0=C2=A0 glib-2-88
> =C2=A0 - !5242 Backport !5238 "gpoll: Correctly zero-out heap-allocated f=
d_sets on
> =C2=A0=C2=A0=C2=A0 macOS" to glib-2-88
> =C2=A0 - !5243 gdbusauth: Unmark a new string as translatable
> =C2=A0 - !5259 Backport !5248, !5249: several Meson/gcc fixes to glib-2-8=
8
>=20
> CVE-2026-58016 patches refreshed due to context changes in the new
> version. The patch content is unchanged, only line offsets updated.
>=20
> Fix buildpaths QA error from upstream !5259: use the .in template
> as input for the installed service file. Submitted upstream:
> [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5261]
>=20
> ptest results (qemux86-64):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.88.2=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 2.88.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 diff
> =C2=A0 Test binaries:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 308=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 308=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0
> =C2=A0 Sub-tests:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6=
207=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6207=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
> =C2=A0 Passed:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 306=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3=
06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
> =C2=A0 Failed:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0
> =C2=A0 Skipped:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>=20
> Pre-existing failure: glib/gdbus-server-auth.test (SIGABRT, same in both =
versions)
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> Changes since v2:
> - Dropped unnecessary output rename in buildpaths fix patch, kept only
> =C2=A0 the input change per upstream review
>=20
> Changes since v1:
> - Added patch to fix buildpaths QA error, submitted upstream as MR

You can cleanup the subject line to just read:

"glib-2.0: upgrade 2.88.2 -> 2.88.3"

since we don't need all of the info listed there. glib-2.0-initial and
glib-2.0 would always need to match.

Cheers,

Richard



