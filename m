Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AC7C531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 14:29:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11319.1785076193151163057
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 07:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XT0LHxTB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so14797925e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 07:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785076191; x=1785680991; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NPD1AMTnmnoYeB9ZSPdeiAPAKrTGj5lrSu165Qpc7YE=;
        b=XT0LHxTBghmCCirbIsWhR67VCtdxjCSrpfAO42fRZAvOMlUy6O+Vr3XwLArwwxyzW/
         UyPMk4SL8cavNaHSOxngiyhjKAbvJ1KqdvwSsp/bym1O2KiFyT19g1dkb7tSK7/I3iOk
         12USe685ha5AYnh9Br4O6RoOp/Flss6GrXkcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785076191; x=1785680991;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPD1AMTnmnoYeB9ZSPdeiAPAKrTGj5lrSu165Qpc7YE=;
        b=A7g2msAlU7XR7IEEBdMVHbgQYMEFEQir2HaScwtcVDqi98m7jLihB4EGS2qYrM6M9b
         0Xd0kopXF5kU1Ve7EKMGBuZXebkwzEI1tOO9OZ5/KmeahBZC2PGJdby+td9t5k5EHmZL
         p8hcuLuFkZbm3IND2juLgFSdErSSj/qDG7MARfBBlDDy/ivruAJR4Mpdzf3aKITEW+14
         5dewXW3ZV4hJuXFdTHUj1lahSbvK4UJg9BjxTw9f2XHDbsCDTTevGya9woutrIvuOs93
         9gunUhdH0TaSQK8A3VAuKpplod8/CUUnyV/Npd1CTaB3fVPJjyixt1RWXcLOXTqu3Mx/
         k/2A==
X-Forwarded-Encrypted: i=1; AHgh+RqD0TKSMT1TnHn9FzHfrDNCC4fChjHBpRuvwBFYT7cibyCH1rcsyD4oCqfDlC68gUEKW3/pD+pyYX5tEiByqansvw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YynFdeqwSCsW5sK6gNSUN+kV29IyMBQ6VWXi2Kte7sxSo8KYDTr
	napHaRf7BHMw9F9RzNfGbRMUNBAylLU/GAV6fUblnlgLXolrUGvF1Evx0EJh/PwURFs=
X-Gm-Gg: AR+sD12Nvl+/ZhrR0Oi9Wm0AC/qTs5Qwj8RPfl6CIyJ3NazzYWy8E+oil4Va3ZDWgg+
	iNW0CyeUHJgM5QoZ5wKuCCvZJdEG45mCs/cLVusn8t9Xc2PdVvHwqJI6LDToNHuIMsbicsI71Rv
	2iYTJvtKyO9WSdRUT9A+aFCRIfZAsaYzo0aCWGa9rWO505XIdVTtvhDCmaQ2cCNeKbyYJqMELLs
	ek/Iza9HLJwFAcDKpPyIZVZNtfAvMywkcOv01nVk67/1oUxonDariWXkCE+wi1kt1DD1Rp+FFDl
	waQUMwFw0Fe39e/V+tW43EX0hbaGbZfjhT7CkvNA5rdREoxjKt0GgdC9PSrtfETnDBoTUnH/uj1
	NQa1sjC4RkeVY2cSUl1J/T9D83ISaPZJfahThC396znkQx/M1GWDwi4vIZThg3XkeaQK4kSr+TL
	tD4I5RmPqCasnXujcysVoKBXRahzzmAUc+5G8wzUrMvJdE64f6QVmTsUxVGag3gckaRoc=
X-Received: by 2002:a05:600c:19d3:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-496b5c85addmr69032125e9.16.1785076191236;
        Sun, 26 Jul 2026 07:29:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a3ed:a478:dbfa:c28f? ([2001:8b0:aba:5f3c:a3ed:a478:dbfa:c28f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b485ff2csm184812255e9.6.2026.07.26.07.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 07:29:50 -0700 (PDT)
Message-ID: <795cb8804b9aaed451b12b6691c2f0d584e9bb62.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v9 0/8] rpm: 4.20.1 -> 6.0.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sumanth.gavini@windriver.com, openembedded-core@lists.openembedded.org, 
	alex.kanavin@gmail.com
Cc: esparlin@cisco.com, mathieu.dubois-briand@bootlin.com,
 mattware@cisco.com, 	peter.marko@siemens.com, randy.macleod@windriver.com
Date: Sun, 26 Jul 2026 15:29:48 +0100
In-Reply-To: <20260724200424.954199-1-sumanth.gavini@windriver.com>
References: 
	<CANNYZj-hrPf-CVJwTaEJ6dgUuWnipYKKiPZ3r_t1_HPYhCKvYg@mail.gmail.com>
	 <20260724200424.954199-1-sumanth.gavini@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 14:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242015

On Fri, 2026-07-24 at 13:04 -0700, Sumanth Gavini via lists.openembedded.or=
g wrote:
> * V9:
> =C2=A0 - Updated SRCREV to the 6.0.2 tag.
> =C2=A0 - Incorporated all V8 changes and updated them as needed for 6.0.2=
.
> =C2=A0 - Dropped
> =C2=A0=C2=A0=C2=A0 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH=
.patch
> =C2=A0=C2=A0=C2=A0 from V8, as it is no longer needed. After filtering ou=
t the
> =C2=A0=C2=A0=C2=A0 /usr/bin/pkg-config file dependency, "bitbake core-ima=
ge-sato -c
> =C2=A0=C2=A0=C2=A0 populate_sdk" completes successfully without the patch=
.
> =C2=A0 - Fixed the filtering of the /usr/bin/pkg-config file dependency.
> =C2=A0=C2=A0=C2=A0 pkg-config is a build-time tool, not a runtime depende=
ncy. Filtered
> =C2=A0=C2=A0=C2=A0 the /usr/bin/pkg-config dependency automatically detec=
ted by
> =C2=A0=C2=A0=C2=A0 pkgconfig.attr for packages containing .pc files, prev=
enting
> =C2=A0=C2=A0=C2=A0 unnecessary hard runtime dependencies in -dev packages=
.
> =C2=A0 - Removed v8 libarchive-related changes since the latest version
> =C2=A0=C2=A0 (3.8.8) already includes the required updates.
> =C2=A0 - Fixed the "oe-selftest -r debuginfod.Debuginfod.test_debuginfod_=
native"
> =C2=A0=C2=A0=C2=A0 failure observed after upgrading to 6.0.2.
> =C2=A0 - Verified that previously reported Autobuilder issues are no long=
er observed.
> =C2=A0=C2=A0=C2=A0 The following builds/tests were successfully completed=
:
> =C2=A0=C2=A0=C2=A0=C2=A0 "bitbake core-image-minimal"
> =C2=A0=C2=A0=C2=A0=C2=A0 "bitbake core-image-full-cmdline"
> =C2=A0=C2=A0=C2=A0=C2=A0 "bitbake core-image-sato"
> =C2=A0=C2=A0=C2=A0=C2=A0 "bitbake core-image-sato world"
> =C2=A0=C2=A0=C2=A0=C2=A0 "bitbake core-image-full-cmdline:do_testimage"
> =C2=A0=C2=A0=C2=A0=C2=A0 "bitbake core-image-minimal:do_rootfs"
> =C2=A0=C2=A0=C2=A0=C2=A0 "bitbake core-image-sato -c populate_sdk"

I think this series may be causing a failure in libarchive ptest building:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/4241

Cheers,

Richard

