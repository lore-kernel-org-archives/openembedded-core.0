Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0DECD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 06:09:44 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47692.1780898980498874485
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2026 23:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fyRSoLwl;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ce9ddeddefso43965806d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Jun 2026 23:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780898979; cv=none;
        d=google.com; s=arc-20240605;
        b=iStQYsJ+67TButxwk633/TC/wL8HEwussTYXq6WaG5ip3zIUlD6NveIlnQ1vaj+9Rz
         mK5jpNY0md3nAxvNQTB2Bm4j6veL8z/90hb2R8omrXxgypYUKZ4rM9ZnsBa9AGg8ksZN
         0g5iKpjeIXsPpNcUazVUNhDKFqXYjAjASnLsl0n+fwutIg/iyxZhqJSnuZd69TKVvn5d
         Q8kAd0SndK0Koh/P4zdSNotXS5+X05xyCYR2UeRdSJaXhK9JTLAR/atWoysXBgxqBW4x
         /PZchYDNyHq0Mc2EKUF3tHZgbHDskHZyIuG6AiDYafdaaqYSOO6JyZ/SirCdyvQZUSb9
         8Qfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dKmjV4RXhAj1C9554Xms3x34m129S9NEiOcxTQmrDMw=;
        fh=V50Vyt6CBESWmKHtWGu/NpIzDjH77vJdZNmD4cPuvhc=;
        b=YPRubnXjNQWug7CaUnssSJcy2AKuI/aCCJizaf3eOrSXUcbtc2K+MVnLY3O1iRKwrG
         AL8VvR17DghvLZYxAfNEXqCXCXG5RW85GUoXPXHBe2C3kPaT+aDVTdaefn1hnRxTdjBO
         GqcU0ALkYBpRZl76MG2HqtZ1yt/Ivc4wXLe7qMD0JScXDGjK1qaaM5sYlpu6z3RrIFLw
         yaYpdQt6BFjwotHtkVA6RDx1dUJb61ayUimkJmUeleTl9Ov8l/Zd4QGq8kUMRB4DGIL+
         9ITkY8WTEh9mZuVrIdHESF0od6RWjqVjOKqET0TWHjmldak4lmpH5lT+rKkrOHuRNuVi
         FAiQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780898979; x=1781503779; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dKmjV4RXhAj1C9554Xms3x34m129S9NEiOcxTQmrDMw=;
        b=fyRSoLwlIxui+BZ7ste9QcPcDEGJmmdFE4W7WBjiX63tQuNyhwenjN8x2Oo/rsT68F
         yUTn/BzXow4D1k19t/GSyffwSpBip937u/mfksVKcvAdc2tmdZtwAoiiMxvz1Mr9JZNC
         f9rtrxLJ2Q4C4IQOq9hyircNJXoFH8jbP9pTBmjKnjmVi0fxi+Cxs6B/n4wNj79NoTEU
         EqkwbD1OxUYBYGfnwsO4HMwwbBfAOahi3+bM6D+u/X4nBkuoBNNGQDKWx82y+I7b5R97
         oL3OyyQqZBLkfXmndLPxV4nI9h7uRCACYpebrwilyMS5W/m2BwoUM0J086xIour8v/Da
         kVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898979; x=1781503779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKmjV4RXhAj1C9554Xms3x34m129S9NEiOcxTQmrDMw=;
        b=rogPMReDhR6ohYRmrkGtlzngGG+ILYtVlaOffBkQEYFd4BFYL1+Bq4vNpoNx6V3tq+
         CMUVu76vG/sWA3F4lrQhYJoq/a9qEihBlZ/GE7D+2DNiV9rlGl/RJlEkJny7JaULa/gf
         eLNIpnBJtRYsybM0zD7LRSCXUie4qAFWK4BG7Z24zHz18LgIWuzFfxteNS9lQ8TdeCxs
         PTKpN9uYKnUMKib1TxEBcz2NSmRaVP+TydD2AjphbGVTwWeGq0WER4gYVxfr1d+wbrE8
         oJ0kgihf71nolls1D9RYaimMCnqZawrqX0L92BHyG4sNPTLSuTUUBEvhK9c/+RW0dVsJ
         Mo0A==
X-Gm-Message-State: AOJu0YyTWYRNbGdEyip9NTH2GEjFjJq3XlP8gyLZQy+32dfH8G6GRyFS
	RSFs2phHzUE31bmZ5/mx2a0wCieKpzfAPdIKVbxtp5OQNxnWgQwGK3DxL0RZA8ziduuIQ8kI7Dq
	fnt/c7ixugKWKwNMMjUQsPMsGx+MwGtc=
X-Gm-Gg: Acq92OHcbr1nQ6Xl2tm/d7umGBg28Dvb35PPHzaflJ35abK6Mf/gaQ1nj4y9QRxobpn
	r+Jq9ZBGoJgJ2sKGaVLvAvBDp46bgfkBLFRHNS0SNFqqqFB6vUXaj9j6qQTWE5XZpPkVZCXunYH
	mDTKeb56IVsSfbSIUE+RzWKV6Ta5uFUv5/V8hCn6HSXVl+Bd7Y0N+f328+yDvzDGYSjeqB/4Pf7
	OQIbarbdWQMNvATgAWBOZxaPDRWczzODd/E+wS0GowAmq2AVFJI2K8iWx1sbRQoMA1jy7791+WW
	F3q9OUTg7GTnTM8ZsLcg
X-Received: by 2002:a05:6214:570e:b0:8cc:ccb:48d9 with SMTP id
 6a1803df08f44-8cee63b0a85mr241570346d6.38.1780898979376; Sun, 07 Jun 2026
 23:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260607174013.36552-1-zuzana.valekova-spitalova@siemens.com>
In-Reply-To: <20260607174013.36552-1-zuzana.valekova-spitalova@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Jun 2026 08:09:33 +0200
X-Gm-Features: AVVi8CcZNN9MqqqbS8T4rQ3KOOEmY5DKUNBC7843XS9i8r8f7b2V_c2UEV1RRBE
Message-ID: <CANNYZj90A7ovz4jE+aXdixNikJ==SFnFz01rjVFsua+q7-kydA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][oe][meta] runqemu: introduce unique instance ID
To: zuzana.valekova-spitalova@siemens.com
Cc: openembedded-core@lists.openembedded.org, adrian.freihofer@siemens.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 06:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238227

Can you please provide an example of how this is used, and what
benefit it brings? "Would be nice" is a bit too vague as a
justification.

Alex

On Sun, 7 Jun 2026 at 19:40, Zuzana via lists.openembedded.org
<zuzana.valekova-spitalova=siemens.com@lists.openembedded.org> wrote:
>
> In some cases like running multiple QEMUs, would be nice to have an option
> to distinguish between them. For this reason I introduce an unique instance
> ID based on time. Later in cmd, the '@INSTANCE_ID@' could be used for QEMU
> identification.
>
> Signed-off-by: Zuzana Valekova Spitalova <zuzana.valekova-spitalova@siemens.com>
> ---
>  scripts/runqemu | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 2c126e7f54..2de69dcd7c 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -227,6 +227,7 @@ class BaseConfig(object):
>          self.qmp = None
>          self.guest_agent = False
>          self.guest_agent_sockpath = '/tmp/qga.sock'
> +        self.instance_id = None
>
>      def acquire_taplock(self, error=True):
>          logger.debug("Acquiring lockfile %s..." % self.taplock)
> @@ -1111,8 +1112,11 @@ to your build configuration.
>          self.nfs_running = True
>
>      def setup_cmd(self):
> +        self.instance_id = str(int(time.time()))
> +
>          cmd = self.get('QB_SETUP_CMD')
>          if cmd != '':
> +            cmd = cmd.replace('@INSTANCE_ID@', self.instance_id)
>              logger.info('Running setup command %s' % str(cmd))
>              if subprocess.call(cmd, shell=True) != 0:
>                  raise RunQemuError('Failed to run %s' % str(cmd))
> @@ -1623,6 +1627,8 @@ to your build configuration.
>          if self.bios:
>              self.qemu_opt += " -bios %s" % self.bios
>
> +        self.qemu_opt = self.qemu_opt.replace("@INSTANCE_ID@", self.instance_id)
> +
>          cmd = "%s %s" % (self.qemu_opt, kernel_opts)
>          cmds = shlex.split(cmd)
>          logger.info('Running %s\n' % cmd)
> @@ -1647,6 +1653,7 @@ to your build configuration.
>      def cleanup_cmd(self):
>          cmd = self.get('QB_CLEANUP_CMD')
>          if cmd != '':
> +            cmd = cmd.replace('@INSTANCE_ID@', self.instance_id)
>              logger.info('Running cleanup command %s' % str(cmd))
>              if subprocess.call(cmd, shell=True) != 0:
>                  raise RunQemuError('Failed to run %s' % str(cmd))
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238224): https://lists.openembedded.org/g/openembedded-core/message/238224
> Mute This Topic: https://lists.openembedded.org/mt/119693437/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

