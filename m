Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CCDE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 12:10:23 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.12596.1733314213883710209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 04:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B0Hsk5ER;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d8cf27d831so2974636d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 04:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733314213; x=1733919013; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6UA6x0So1BrHHg6cLu7OPFSVQrDuFzn+xIHFjStW4o=;
        b=B0Hsk5ER9oTdGZxbCSyMm7HfZ4buu3PIKTGrf7+vm79omFzX7Y6TYIKZdUQUqB1Jfi
         yK3B4qEkGwog+9aphdo66fsvTPBjfHewa/Bx6e2c8AO0BQlZVMOSxiobgF+LCy/Mf2fF
         OCnyU8c/gN/2Igs0GDVDLxBPARK9ITOWefsNSEDy4LtOD3ah05HDCkgv+1TX7I2iVxKk
         PxRooFgmhbysSgoRRnty51GaBwfXZPodqypGz6WvuJBxGVVbFLUIFM9kQAFQ+N6Q2qYo
         k2OzMb1UGe2t3MLSP1u9ou0O8Hu0knyjppBfwjKNlhkjWgji8y6GMpuTA50oDBuv1Gmz
         l50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733314213; x=1733919013;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6UA6x0So1BrHHg6cLu7OPFSVQrDuFzn+xIHFjStW4o=;
        b=lSvXRJySDuWyBbizZcaIIkpZCRk53o+EeatH3UFVb3RY/hQ/Dzovf9C5b3Y6/sDMSg
         1O6Mcf6VTS2fUwG3tWN6nyiXCXnLlmJh1/smBsZaELwZMBlqZQ75sd65m3V//VLhsaLu
         GOF85f1TK/6Jixpp0vytUr/wDZL0kHY6DtdMwHEB9mqCUUZi5tEorUW6+9PT6Oyc6AGX
         bzcAtgIlSL6LVVmP29k5DRjlWco+edMOjLBnkFZLCGFxUXCZA/aeMtPqrflt0wo5KJzh
         YZ5fJXUbajfBAR0XmU/yj6NmXdoH+5UQFjawvjN6kPQK7iQhk/zLbyyCGRq+lK4yWwMp
         rs3Q==
X-Gm-Message-State: AOJu0YwAI6lhOG7uIO4LDLqotAJBtMTkVWzNe91gLk4s3Lpg+bdkeDGL
	KFNMhAwNuD7jG1GuJaRcnI5zX/lPekrl8sRqnt5+OvMu63lni/zwEE9/KAxrZj6Qz3ecO6bB8kt
	spfMiyDu/Ojg8MnX2Jy4zlxYfb6I6Iw==
X-Gm-Gg: ASbGnctJ/uKuIPy1q3eRcmjRjemurkiQcUBZwLEsQUfjEl2JJZ/zdWRuKhWR4pmGgBy
	8QlTNUKkd2yQ38I3tVz30weBhduFP2kEP/Tp/S3BEskAC65P4VJeVE7aiR5C8JxhYbg==
X-Google-Smtp-Source: AGHT+IG32yXWBbCqrUSlN6zDPIp7anp6w3qdtHMve+ZCMgOSOMehCVZvRq78VRytPOoJxf3ROWBLsKJASpQWIwPuojo=
X-Received: by 2002:ad4:4eaa:0:b0:6d8:a1fe:72a4 with SMTP id
 6a1803df08f44-6d8c46db0a7mr52978646d6.46.1733314212841; Wed, 04 Dec 2024
 04:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
 <20241204064920.817016-35-alex.kanavin@gmail.com> <Z1A1DRlmtB8eR7bk@bootlin-mathieu>
In-Reply-To: <Z1A1DRlmtB8eR7bk@bootlin-mathieu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Dec 2024 13:10:01 +0100
Message-ID: <CANNYZj_fkUH79oTzi6fb81z_H96U_h-obS+kDgjicoZm4+OhSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 35/37] librsvg: update 2.58.2 -> 2.59.2
To: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208280

On Wed, 4 Dec 2024 at 11:55, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:

> I believe this rsvg update is breaking builds on the autobuilder,
> because of a failed patch apply:
>
> ERROR: librsvg-2.59.2-r0 do_patch: Applying patch '0001-gdk-pixbuf-loader-meson.build-do-not-look-for-gdk-pi.patch' on target directory '/srv/pokybuild/yocto-worker/genericarm64/build/build/tmp/work/armv8a-poky-linux/librsvg/2.59.2/librsvg-2.59.2'
> CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/genericarm64/build/build/tmp/work/armv8a-poky-linux/librsvg/2.59.2/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-gdk-pixbuf-loader-meson.build-do-not-look-for-gdk-pi.patch
> patching file gdk-pixbuf-loader/meson.build
> Hunk #1 FAILED at 36 (different line endings).
> 1 out of 1 hunk FAILED -- rejects in file gdk-pixbuf-loader/meson.build
> Patch 0001-gdk-pixbuf-loader-meson.build-do-not-look-for-gdk-pi.patch does not apply (enforce with -f)
>
> https://valkyrie.yoctoproject.org/#/builders/60/builds/584/steps/11/logs/stdio
>
> Can you have a look at this issue, please ?

Thanks, I just sent a corrected patch.

Alex

