Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75054C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 09:51:43 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.7152.1644141102062161108
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 01:51:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q6/RGcqX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id h6so915313wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 01:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Hc3/ydXSp82E2SPtCN1f6MSYlTj3XI4JAHVT8CMCyZU=;
        b=Q6/RGcqXrvG69h2VIT7AFRn847mw2D2cGWL2fNK9g/jiZnK75y5RoELOfzk32D02l/
         798BomJ8GPdZtIQB5Ox/XJH5I/JqBVRf78gYMkBikJmg7A1kYR8eyIpaDEzdqQ44MdCm
         cJEFwUWJgm4L97EZWS4f2fsOLXH3MQ2ppByJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Hc3/ydXSp82E2SPtCN1f6MSYlTj3XI4JAHVT8CMCyZU=;
        b=Rf+2AEv3yhzhuVRemzkbfQEiNYMTQTUmAdEVEtUVLXP/Ctz2LQwF1TSCdNl3sH+Hky
         9R1BpuRCAWKUG22iQZwqgYM5IVG3PlvVW9VxSA7h8ai1XMGWmVk2FCcOP46JNnBApxVs
         JrVdECUeQJ6+vvHHi0rAmypUD7Rz4adHqPpTMxvhkd4nGxVTDzr2MX7HAsV/Gl5yxevO
         hCCSgoFcLq35Xath0Pi7jJW/VigiQfR0SyH+Ae6xGknNY0f4Z+6jDjXrkmxbF29JWB/v
         Z7Psrjwg8xLNodgRFj63nKo5wV+YziTXl676Gkj7W6usO/q+1kfcfOPqy67MoJs5MVAf
         QOjA==
X-Gm-Message-State: AOAM530Qcgcn1ju86iV2WmC+aBLgdX1etrxLak5BhsjxPwhQW59p4ZDl
	YjgP5UVKCU37EW9l365ABvaMDw==
X-Google-Smtp-Source: 
 ABdhPJwJo59q+h6mp9xJbEuie0PB6huroXAJEkoQQLNzOoyMcqBGE+kffvgwfqdi7nkK+MSRD9cMQQ==
X-Received: by 2002:a5d:6143:: with SMTP id y3mr5880793wrt.556.1644141100340;
        Sun, 06 Feb 2022 01:51:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aabf:a020:d9fb:13aa?
 ([2001:8b0:aba:5f3c:aabf:a020:d9fb:13aa])
        by smtp.gmail.com with ESMTPSA id
 a15sm6728682wrp.41.2022.02.06.01.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 01:51:39 -0800 (PST)
Message-ID: 
 <458e0a2ee619b96049b9ce072ae1fb4c3a195d18.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] runqemu: preload uninative libraries when
 host gl drivers are in use
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Sun, 06 Feb 2022 09:51:35 +0000
In-Reply-To: <16D0E3273582D58F.23031@lists.openembedded.org>
References: <20220204204027.2323845-1-alex@linutronix.de>
	 <16D0E3273582D58F.23031@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 09:51:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161394

On Sat, 2022-02-05 at 12:20 +0000, Richard Purdie via lists.openembedded.org
wrote:
> On Fri, 2022-02-04 at 21:40 +0100, Alexander Kanavin wrote:
> > Some of the host distributions build the drivers in a way (RPATH/RUNPATH)
> > that tricks uninative loader into loading pieces of the host libc, if
> > the same pieces haven't been previously loaded by native binaries. Mixing
> > the two libc versions leads to failures.
> > 
> > This change ensures that the correct (uninative) versions are always in use.
> > 
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/classes/qemuboot.bbclass | 2 +-
> >  scripts/runqemu               | 4 ++++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> > index cc1cbce69d..229bd88527 100644
> > --- a/meta/classes/qemuboot.bbclass
> > +++ b/meta/classes/qemuboot.bbclass
> > @@ -109,7 +109,7 @@ def qemuboot_vars(d):
> >      build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
> >                  'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
> >                  'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> > -                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> > +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
> >      return build_vars + [k for k in d.keys() if k.startswith('QB_')]
> >  
> >  do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
> > diff --git a/scripts/runqemu b/scripts/runqemu
> > index 4e05c1bb15..7d1f85f357 100755
> > --- a/scripts/runqemu
> > +++ b/scripts/runqemu
> > @@ -460,6 +460,10 @@ class BaseConfig(object):
> >          except subprocess.CalledProcessError as e:
> >              raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
> >          os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
> > +        uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
> > +        preload_items = ['libdl.so.2', 'librt.so.1', 'libpthread.so.0']
> > +        preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
> > +        os.environ['LD_PRELOAD'] = " ".join(preload_paths)
> >  
> 
> This looks like a good way to work around this corner case and I don't see any
> other alternative. Can I ask that:
> 
> a) we put some comment into the code so we can understand this in a couple of
> years time as it is a rather weird corner case
> 
> b) we put some "if os.path.exists()" in there, maybe even just on the uninnative
> loader direction so that in the non-uninative case we don't throw warnings?

I've added a tweak doing this into master-next.

Cheers,

Richard


