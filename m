Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8D37CBDF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 09:20:42 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k8so41725767iot.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jDmPL81vM3xMRSCH02qsSjv2lyLW5sXjIlOxriL5z7c=;
	b=IEWmQLGCfavd4AaJrE/6FvVWaATmxxg6Z/SmmZCNt1CNc9jh37/T32Zh0mr2C4siFr
	l/amPmqFW/k9y0q03z7pEmmjo14CnEhQUpiiUcRQnvCzviUj0RzWcHGKFBAxU39V/bbG
	4Qr2DPs6BuXAQ2nyMNSlukD7THKS8wVPrPyfj40WoCYBQI8AekZkbg1v7Ynrt6ZdkAEz
	EnIVioSfqmO0UMMMEPKvb7xEI1k0SJBn7Il7SygdfMvQoGzowwHGBVOOWwQ7kHJpiVJL
	8ucr1QvEAcpSral2Y7mQbKs7btmovX3FHDWjYTyqVwQ+icwmBlYtv1YY+AovAPxD2rNL
	6V/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jDmPL81vM3xMRSCH02qsSjv2lyLW5sXjIlOxriL5z7c=;
	b=oWnmnI7F/Yh8ZwAmitseKQycpbGu4ekV7R+bG/HQLdqlvHr0QuN5ra+nt873Xvkl/f
	0EA6Pp5Y1IrHP/qW1g6beEK14d8gDKB+Vz1e0h7+GrYduSd4x2j/yPCk/1WrLrKWdSA/
	c5/mcBxx39teRZjUDzpTTBxVcXCrThkbwFrhORXTaTWVNRQxqJ1baMvVSKQ7TvDHVIaw
	SW1NimXBxoPSdWEeS+coksBZDuJfmOPUva/0oHiOU6k2WyyHma/9EOnuGSebbY5+ke0U
	k01NTOD1E1bVn/fYgd5Pa+TtGjvUOFXA8guBjs6K7xHRh9olNAPGOVqrj/E6AuwePhUS
	iaZg==
X-Gm-Message-State: APjAAAXJ+NXQeQnqiOoiQPEdu4I6YEK6nII+LgFU5lugDFv/K5VagyM6
	JoN9aW8KIJ1W4gyLMVy1wJKgfGbc0k9BCRe2cRJx7Q==
X-Google-Smtp-Source: APXvYqzLYKiGWUZIS0OZ5SrxgsiM4vTIS6+vibxhBAq6dW7V6PxgMpe5vWhHhBOgQiVTmYn1OyxhCF/5AheBe/2Z5yk=
X-Received: by 2002:a02:914c:: with SMTP id b12mr27784551jag.105.1562664043278;
	Tue, 09 Jul 2019 02:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190708234643.15636-1-ross.burton@intel.com>
	<ec99b2a2-dd19-e386-87bc-093e7e35aa47@gmail.com>
In-Reply-To: <ec99b2a2-dd19-e386-87bc-093e7e35aa47@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jul 2019 10:20:31 +0100
Message-ID: <CAJTo0LY1Rw1-cZaoeJ5Yrkras-TyHrkkLA9tMd+K2-sGEMhpww@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory: don't output ownership for the sysroot
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
X-List-Received-Date: Tue, 09 Jul 2019 09:20:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2019 at 02:11, akuster808 <akuster808@gmail.com> wrote:
> On 7/8/19 4:46 PM, Ross Burton wrote:
> > As the sysroot isn't ran inside pseudo the ownership is whoever is running the
> > builds.  In a setup where multiple builders all contribute to a shared
> > buildhistory writing the ownership data isn't useful, so just replace it with "-
> > -".
>
> Should this be backported?

No, because the sysroot writing patches are not backported. :)

Ross

