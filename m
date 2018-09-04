Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 654D274FCB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 09:16:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id k5-v6so3123286wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 02:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=h+PNxn9Ls9OdBasPtA5uvHwNUWd7nFyr625TSP9bYNs=;
	b=YYHtL8xvmDuj/mqAqO74wLWAdIUzDpI702h8IfXa4+W19lbJxrtL9YK8+zK4EF2VIj
	SqFKBjYBBbM/cJlP404qiElAq1YRwRU4IScw0IZsqw7D+OPb8hxHDOZ83s97vOVXDMtJ
	x26uV+xjENJ09wj4ropqYaYWS1uUldhvQbJqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h+PNxn9Ls9OdBasPtA5uvHwNUWd7nFyr625TSP9bYNs=;
	b=kmkDG58UNsWBp0Av0Qg/eWI/7JLbsdjHb+l70F4m5uIuKsLDTziw5fzYfjune3yf+H
	T/k4VKH4zRNo791WgJygU1ScUN7SoOHV7iWz8UFyN+qWx2rpA2YMC6QWYjEmtXoTyCb7
	DyJcUtKWtTz9mKkJ7K7DT0li+YYChtqUwqDavWG2owwoiqlKCJvhXz3v1fKlBSkcWH9l
	6oW0C1EJdrPOptyl+BJxgcJ0U4LoyBq/Znf1ayr1S/l7HTc31hpPR8wOS2cBReTOLfYK
	V9f4e9m3OgkOX1iuzZ+D8nnhjD1XXX4f1UzToIS5MDGZ+rPteUs7cyZfvJFXUe8KnKmw
	YKFg==
X-Gm-Message-State: APzg51BazyVmoYaEXciTgxKRUEPcx9G8XThA5DTbNkYwNnoDtUUmYsDq
	DR0JAlsOvkXPrwInVkgUiiddaA==
X-Google-Smtp-Source: ANB0VdZx2y75U41baVBj74KDhH4/fqPEekGTu0vCGDwPbJaFndpINsUtn0L+IwaVDvVd/KWwPrA+Kg==
X-Received: by 2002:adf:e486:: with SMTP id
	i6-v6mr22740324wrm.145.1536052611115; 
	Tue, 04 Sep 2018 02:16:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q16-v6sm16748140wrw.2.2018.09.04.02.16.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Sep 2018 02:16:50 -0700 (PDT)
Message-ID: <ee98b583c37153254c89db81f231fc9acd52a023.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kai Kang <kai.kang@windriver.com>
Date: Tue, 04 Sep 2018 10:16:49 +0100
In-Reply-To: <5495bfab4433691120e9300132a3a16a0a77d182.1535288685.git.kai.kang@windriver.com>
References: <cover.1535288685.git.kai.kang@windriver.com>
	<5495bfab4433691120e9300132a3a16a0a77d182.1535288685.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] multilib: fix install file conflicts
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
X-List-Received-Date: Tue, 04 Sep 2018 09:16:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-08-26 at 06:06 -0700, Kai Kang wrote:
> Fix install files conflicts between multlib packages:
> 
> > Error: Transaction check error:
> >   file /usr/bin/g-ir-annotation-tool conflicts between attempted installs of lib32-gobject-introspection-1.56.1-r0.x86 and gobject-introspection-1.56.1-r0.core2_64
> >   file /usr/bin/g-ir-scanner conflicts between attempted installs of lib32-gobject-introspection-1.56.1-r0.x86 and gobject-introspection-1.56.1-r0.core2_64
> >   file /usr/bin/cairo-trace conflicts between attempted installs of lib32-libcairo-perf-utils-1.14.12-r0.x86 and libcairo-perf-utils-1.14.12-r0.core2_64
> >   file /usr/bin/icu-config conflicts between attempted installs of lib32-icu-dev-62.1-r0.x86 and icu-dev-62.1-r0.core2_64
> >   file /usr/share/gir-1.0/GLib-2.0.gir conflicts between attempted installs of gobject-introspection-dev-1.56.1-r0.core2_64 and lib32-gobject-introspection-dev-1.56.1-r0.x86
> >   file /usr/bin/gpgrt-config conflicts between attempted installs of lib32-libgpg-error-dev-1.32-r0.x86 and libgpg-error-dev-1.32-r0.core2_64
> >   file /usr/share/pkgconfig/udev.pc conflicts between attempted installs of eudev-dev-3.2.5-r0.core2_64 and lib32-eudev-dev-3.2.5-r0.x86

.pc files installed into /usr/share are architecture
independent. Either it is arch dependent in which case its in the wrong
place, or it needs to be fixed.

We are not putting these under control of update-alternatives!

It would be helpful to understand the kinds of differences in some of
these files. gir files in /usr/share/gir-1.0/ should also really be
arch independent...

Cheers,

Richard

