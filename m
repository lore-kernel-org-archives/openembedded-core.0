Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEFAD111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 11:05:59 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19369.1764587150649969526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 03:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kb3qhstg;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-882390f7952so45165086d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 03:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764587150; x=1765191950; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=igFg7pCj+NFqWUZf7sicSm/dYsBmrhEwhAqWMPr8sik=;
        b=kb3qhstggiJ5UhLeKBhDrbMCh1RdWetEO1hxvnPPR8k8l0YQNdoQVPd98NHiXyhBdH
         3R8lOYM2EyjYhORebbEw+h+1IKPo1KxClfLOhrscmLn0hp5LfEwVU0XcVHsipLg/lQk6
         8Eszxi/NIijpMnp9GGjfiLW4eWMuST7jHbDzVTK3qCyxRKZIR8miC1tJs6F3eGLc+Qmj
         6xX8+3dNa55VYn/ddK6k7tCYn/n8zElLTwlWscxG8z8ysj5sPb9lko17UHcY13lMQyDe
         jVmJOc4ZbpFXatYCUMrPHMAJ+HXCqL6fRn16dx4S78jKiR5j7RPyb3g2p5OCLLNiSKHy
         lyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764587150; x=1765191950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igFg7pCj+NFqWUZf7sicSm/dYsBmrhEwhAqWMPr8sik=;
        b=SRyfU/HLNFTvK1J/RfvgKpzIbOg9TVdv/VAJ49vY8kzTAEyRejX39Z8ImFMR7LuaT8
         CvNVoiTeBRX6TQYCA99eHV7u/1Ve3TtnD14hG5cBdcrUTk0DNLzVOQVWRSSrzcJdD0vv
         j8bxbmkkxA/1fjdCVtyddreeWJMzpMiof6Ru28lmRJebN6v7tMqyhIT30Q/iKeyBtxsV
         Q3Jrdhsa0IwDQFS5hzhwliuYmp/FN4gWo26rxVG/Qg/U2Zz+hqHc5MSkSPfH7kZ044Fb
         gaSuS8DSlLRrzKkEBQjPNJUPgHGEHsNbknlzuQp6/uOuS/R8DTADpcm2JP9NtGTcbpcr
         /JEg==
X-Gm-Message-State: AOJu0YyyzpOacc4+6awnHDgbVSdOGUQbGqqLwep7rYKodmGJld0bVG/8
	7TaEMT/wUFCVYcqObIrHyY/Tw6TFJT97Q1qibW6zFmGtAXqpGAE920H4ub5Fcw9PuQ128MA6fXR
	H8lc9v8qqsXraZtR5Pm+k4qtWyhcQwGpLTQ==
X-Gm-Gg: ASbGnct76x2b43V/TyFOMoCUSYqe9C9cQnFo0ncnOLsXZXC9DpcBwjwJjFzBles7xGx
	7LpL1EPacfIIZtoTj5RguhSNnQ07mntdvh0KPSALWV6aItW+kagyx//ud6ElaMONfSHEFPuh9Kw
	bEy+IQhv7UpCcrhGHbQpCAPu2ROu2epKlEcJZ+PoRKqfqkqjSrMSgbwy3cZIMclepMFaqt2mYDh
	VZ+1Zi6UPFpkKAczWwXYr3A9SbMgv/9KBPKJAuVk7RPOlm7KLan+A/PIm4ALYHcn+A4x+VaF1ZS
	vOT5YeFirHjCQl8wYkRhe9Y/wgdlFA==
X-Google-Smtp-Source: AGHT+IGDyzs4b3xEJzucDQegfaghJ1rzQ8006PQfasGGxk1tIQ243pacOpKos7+6RONRjyikoAsTf+jTYMEmtqB3ojk=
X-Received: by 2002:a05:6214:f67:b0:882:4643:b0ad with SMTP id
 6a1803df08f44-8847c546bc5mr546335466d6.67.1764587149432; Mon, 01 Dec 2025
 03:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20251201052523.1222217-1-Qi.Chen@windriver.com> <20251201052523.1222217-2-Qi.Chen@windriver.com>
In-Reply-To: <20251201052523.1222217-2-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Dec 2025 12:05:37 +0100
X-Gm-Features: AWmQ_blgsd8lDijW1n5Gd3yOpnwiRJX5bj9vgFH6PVWT94aibHw3K7Axd2wg_0E
Message-ID: <CANNYZj-A9ZgSyXOhosCYEXqzKryfSUyuz3+wvVhr-UyM=J1XhQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH V4 2/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 11:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227120

Thanks, I think this is fine.

Alex

On Mon, 1 Dec 2025 at 06:25, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> It's possible that users use EXTRA_USERS_PARAMS to set password
> for root or explicitly expire root password. So we need to check
> these two cases to ensure the 'no password' banner is not misleading.
>
> As an example, below are configurations to make an image requiring
> setting a root password on first boot, but without having to first enter
> a static initial password:
>
>   In conf/toolcfg.cfg:
>   OE_FRAGMENTS += "distro/poky core/yocto/root-login-with-empty-password
>   In local.conf:
>   INHERIT += "extrausers"
>   EXTRA_USERS_PARAMS += " passwd-expire root;"
>
> Checking and adding such a banner is ensured to run as last steps of
> ROOTFS_POSTPROCESS_COMMAND, regardless of IMAGE_FEATURES. In particualr,
> we want to ensure that the function runs after set_user_group function
> from extrausers.bbclass. So unlike other commands in this bbclass using
> the '+=', this function uses ':append'.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes-recipe/rootfs-postcommands.bbclass | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
> index f4fbc4c57e..f57782b87b 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -5,7 +5,7 @@
>  #
>
>  # Zap the root password if empty-root-password feature is not enabled
> -ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "add_empty_root_password_note", "zap_empty_root_password ",d)}'
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "", "zap_empty_root_password ",d)}'
>
>  # Allow dropbear/openssh to accept logins from accounts with an empty password string if allow-empty-password is enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "allow-empty-password", "ssh_allow_empty_password ", "",d)}'
> @@ -64,6 +64,10 @@ ROOTFS_POSTPROCESS_COMMAND += '${SORT_PASSWD_POSTPROCESS_COMMAND}'
>  #
>  ROOTFS_POSTPROCESS_COMMAND += 'rootfs_reproducible'
>
> +# Check and add 'no root password' banner.
> +# This needs to done at the end of ROOTFS_POSTPROCESS_COMMAND, thus using :append.
> +ROOTFS_POSTPROCESS_COMMAND:append = " add_empty_root_password_note"
> +
>  # Resolve the ID as described in the sysusers.d(5) manual: ID can be a numeric
>  # uid, a couple uid:gid or uid:groupname or it is '-' meaning leaving it
>  # automatic or it can be a path. In the latter, the uid/gid matches the
> @@ -259,8 +263,12 @@ zap_empty_root_password () {
>  # This function adds a note to the login banner that the system is configured for root logins without password
>  #
>  add_empty_root_password_note () {
> -       echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue
> -       echo "" >> ${IMAGE_ROOTFS}/etc/issue
> +       rootpw="`grep '^root:' ${IMAGE_ROOTFS}/etc/shadow | cut -d':' -f2`"
> +       rootpw_lastchanged="`grep "^root:" ${IMAGE_ROOTFS}/etc/shadow | cut -d: -f3`"
> +       if [ -z "$rootpw" -a "$rootpw_lastchanged" != "0" ]; then
> +               echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue
> +               echo "" >> ${IMAGE_ROOTFS}/etc/issue
> +       fi
>  }
>
>  #
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227114): https://lists.openembedded.org/g/openembedded-core/message/227114
> Mute This Topic: https://lists.openembedded.org/mt/116551793/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

