Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 65D607701D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 07:08:34 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so14080955ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 00:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=MCbK6bo7m86x7SoO3PS5G461pWfRv+sKeZT8Akh5lOc=;
	b=E3GMG1tgspZweHoTuhe8ptYxVN0cq3/LQ+FgA3Ls54yKK4WzfiRtExOGKTY0NKec0n
	bU+3tQ7y6mWenxNaKYKCEtnUgAByRchKwX13m3ZfneMVSju0NLGvrsfa3EOOE//pt2uy
	XSHATVYZrXy9jA7NqFM8rL+PlK1GLNGTwXh24ZzfePYN1rPkc7fEMd4AbdrYSl13IX78
	CNHGxVeDSvb0YIdS9euwXG7P4BuzO3MwW5TinwZCa9SX3/E7BselTQ0/EGa4du0OR/DQ
	m81bPgAcvWwo8pwpWKpqDF6oXybTUPtU6CQMDYBP2b6GeoepvyfwT/SqEcYHBFu1/kr8
	k6Hw==
X-Gm-Message-State: ALoCoQngxR6wIKlEOlkuY1GJ85oF/J1x/vMPAKgMh9/2/QnTbnX4/zKHKcNY78Kt8D7hEPoqviHv
X-Received: by 10.107.131.16 with SMTP id f16mr4181196iod.100.1441350515136;
	Fri, 04 Sep 2015 00:08:35 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB6C.dip0.t-ipconnect.de. [93.232.251.108])
	by smtp.gmail.com with ESMTPSA id c64sm935656ioc.13.2015.09.04.00.08.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 00:08:34 -0700 (PDT)
Message-ID: <1441350512.9573.43.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 04 Sep 2015 09:08:32 +0200
In-Reply-To: <78A0B9F1-2E28-492F-B07B-445089E6827E@gmail.com>
References: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
	<cover.1441305437.git.patrick.ohly@intel.com>
	<f87dd02d2553c3cc459aac628e0435b93e1d32bb.1441305437.git.patrick.ohly@intel.com>
	<78A0B9F1-2E28-492F-B07B-445089E6827E@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] initramfs-framework: create /dev/console
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
X-List-Received-Date: Fri, 04 Sep 2015 07:08:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2015-09-03 at 14:34 -0700, Khem Raj wrote:
> > On Sep 3, 2015, at 11:42 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > 
> >     install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
> > +
> > +    # Create device nodes expected by some kernels in initramfs
> > +    # before even executing /init.
> > +    install -d ${D}/dev
> > +    mknod -m 622 ${D}/dev/console c 5 1
> > }
> > 
> 
> may be just use USE_DEVFS = “0” instead if we are not letting devtmpfs into initrd image

The fix above is meant for the case were devfs is enabled (USE_DEVFS =
"1"). In my observation, a completely empty /dev then prevents booting
under qemu (see the "qemu + initramfs" mail thread).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




