Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F2EC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 19:40:48 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.1967.1634154046969016500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 12:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bwSR28f0;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id r2so3306119pgl.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D24xPoTDvp+Fm43JLw6ew2jPz1dnp0bgpg9tRX0P3Gc=;
        b=bwSR28f0HX8sM06+sYBS3vEXg7FLYUyxGUKUAcmAMLVBr5Zbp6nyaLu0K6LvwRBhF1
         TQd9bS77BTrWh2KI/Wi/f2n5ETKkI3vdhFgYT9uI2083nm6IoOAhuCUzTxpl5Prm/yOd
         7U1xi+LISX07NXx9dkfmQVPhwF4OY5YrACyYuHB7waQtzxGAXYAYgf7yR3vJkWlSSWx7
         Vgm34im2lHBXiJA8VUI/ShFUaEDQGlx8WNYH4XgY2mln669nbhoghWQt8Nz07yO4JGAW
         aiZqDIT28nUSatJtIlwSI+37MPn8/G/tUNKFI8HQvR86fRhhs2WUBpyBlglzaxzp59ts
         Ygmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D24xPoTDvp+Fm43JLw6ew2jPz1dnp0bgpg9tRX0P3Gc=;
        b=jlgdeNHalnudXEBVtb1+U8C7Qq+cK9ipZRf4TcctvvqLx39J0YMHGQe3zjLebH22Qm
         eM/eIbP0tB1bTCPansQoOHNb9AbqFKXL+5za50MNRuWFNITZpfu0e2VFqDJvjCIE/aBI
         t31ZEKEq/LMwqvJsxji83kZt8ZCnrrcfv++WTPQYc4cX5TBtLNA6gAre3IGOt7iyCijD
         Mng9/ziknYiV7ZXu3NFGMBLJpt4I4MzFwBKapIxDgj7T0RSIUwOUISJ/wLMDMdpuPbHt
         fRU91gwsyuRHf3iV+NibgbSuwXygp65KzREw8BAASXKd7Qk9nZCIr130oOLziBFUWDay
         Iayw==
X-Gm-Message-State: AOAM532rUW/4XUs36lGpSdd2L8Es4viPH9ZLbt0SAGA7lrO0CsJuohpp
	4Dv8z9IWOQBuIFii8DVCyLBiryFNTS7X4WY7cFU=
X-Google-Smtp-Source: 
 ABdhPJxOhz7fJU97nLb4v2uwx0nalpwooS0LFc0XvROtQcwyGYFPVTpVucBm3LTQif7GpFLpg4uqHAWhyNgtDp66X4E=
X-Received: by 2002:a63:251:: with SMTP id 78mr953062pgc.54.1634154046372;
 Wed, 13 Oct 2021 12:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211012154450.1279395-1-danismostlikely@gmail.com>
 <16AD52FF51E4A8C6.16796@lists.openembedded.org>
In-Reply-To: <16AD52FF51E4A8C6.16796@lists.openembedded.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 13 Oct 2021 13:40:35 -0600
Message-ID: 
 <CACS+7ZQZ1EDudSOt+Si2J=yJh5Fdfmzp9ABZPz-omkoDCXCJfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] Validate shared state against list of keys
To: Daniel McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 19:40:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156922

On Tue, 12 Oct 2021 at 09:45, Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:
>
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>
> Allow a user to validate sstate objects against a list of keys, instead
> of just any known key in the user's keychain.
>
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  meta/classes/sstate.bbclass |  5 ++++-
>  meta/lib/oe/gpg_sign.py     | 27 ++++++++++++++++++++++-----
>  2 files changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 701a19bc612..3bc92eda3dd 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -114,6 +114,9 @@ SSTATE_SIG_KEY ?= ""
>  SSTATE_SIG_PASSPHRASE ?= ""
>  # Whether to verify the GnUPG signatures when extracting sstate archives
>  SSTATE_VERIFY_SIG ?= "0"
> +# List of signatures to consider valid.
> +SSTATE_VALID_SIGS ??= ""
> +SSTATE_VALID_SIGS[vardepvalue] = ""
>
>  SSTATE_HASHEQUIV_METHOD ?= "oe.sstatesig.OEOuthashBasic"
>  SSTATE_HASHEQUIV_METHOD[doc] = "The fully-qualified function used to calculate \
> @@ -370,7 +373,7 @@ def sstate_installpkg(ss, d):
>              bb.warn("No signature file for sstate package %s, skipping acceleration..." % sstatepkg)
>              return False
>          signer = get_signer(d, 'local')
> -        if not signer.verify(sstatepkg + '.sig'):
> +        if not signer.verify(sstatepkg + '.sig', d.getVar("SSTATE_VALID_SIGS")):
>              bb.warn("Cannot verify signature on sstate package %s, skipping acceleration..." % sstatepkg)
>              return False
>
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index 492f096eaa7..5b3776165cf 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -109,16 +109,33 @@ class LocalSigner(object):
>              bb.fatal("Could not get gpg version: %s" % e)
>
>
> -    def verify(self, sig_file):
> +    def verify(self, sig_file, valid_sigs = ''):
>          """Verify signature"""
> -        cmd = self.gpg_cmd + ["--verify", "--no-permission-warning"]
> +        cmd = self.gpg_cmd + ["--verify", "--no-permission-warning", "--status-fd", "1"]
>          if self.gpg_path:
>              cmd += ["--homedir", self.gpg_path]
>
>          cmd += [sig_file]
> -        status = subprocess.call(cmd)
> -        ret = False if status else True
> -        return ret
> +        status = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +        # Valid if any key matches if unspecified
> +        if not valid_sigs:
> +            ret = False if status.returncode else True
> +            return ret
> +
> +        import re
> +        goodsigs = []
> +        sigre = re.compile('^\[GNUPG:\] GOODSIG (\S+)\s(.*)$')

Missed the deprecation warning here; don't want to introduce new
issues. Hence v2 for just this patch.

> +        for l in status.stdout.decode("utf-8").splitlines():
> +            s = sigre.match(l)
> +            if s:
> +                goodsigs += [s.group(1)]
> +
> +        for sig in valid_sigs.split():
> +            if sig in goodsigs:
> +                return True
> +        if len(goodsigs):
> +            bb.warn('No accepted signatures found. Good signatures found: %s.' % ' '.join(goodsigs))
> +        return False
>
>
>  def get_signer(d, backend):
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156883): https://lists.openembedded.org/g/openembedded-core/message/156883
> Mute This Topic: https://lists.openembedded.org/mt/86265247/3617261
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [danismostlikely@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

