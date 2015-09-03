Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id B415277020
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 06:29:57 +0000 (UTC)
Received: by iofb144 with SMTP id b144so47214898iof.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 23:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=QjTIoKPkfp2AHqH9qlbo58Hzk4V8Ppd7dzoWCKjrmD0=;
	b=IZ1X550i/ChLxbgtVb2y6vJQX8xNnPFA6miB3TBJgEU+BhhnNENOkqnv4Dip7YjArj
	ayjL5U6sG0uuymAdd2eskvcOY8o6Ni0krgfi03FdhcL0kttI2kNmiW8IjMyuAE1rP+2l
	SnJ6ABlUpUsSck03SaNfKm4hVjDb7hwunOvXygqsdjnYj70hcRuQL1ORK6bi2xSFsK+5
	RqRJPbrVu6cvnMHnnr15tRDlUMTz7+fJp13YcXfEW2dWO+RbO3N+CiA4//RAq+pyQNOT
	ZdkcsK1PVg+XEH35xiXVrPEf95FQSxZ2lK6BzuMqPari6Ay32rzCA7QO2r1kaeY91ujT
	HglA==
X-Gm-Message-State: ALoCoQnQ4n6zXFvJlL/sR5mhGxSoLVNTYtE6Dzx7XVoSq1aLuRf+jV8yJ8dxzAyIbKI57Pcx9az3
X-Received: by 10.107.156.136 with SMTP id f130mr20622277ioe.6.1441261797375; 
	Wed, 02 Sep 2015 23:29:57 -0700 (PDT)
Received: from pohly-mobl1 (p57A5686C.dip0.t-ipconnect.de. [87.165.104.108])
	by smtp.gmail.com with ESMTPSA id o2sm3941661igr.9.2015.09.02.23.29.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 23:29:56 -0700 (PDT)
Message-ID: <1441261794.9573.6.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 03 Sep 2015 08:29:54 +0200
In-Reply-To: <CAP9ODKqiej_Nm_4Rrb1J-BWFwSG8hWzLZ3So_BUSKQ-gKWzCjQ@mail.gmail.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
	<3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
	<784e52fcd898a07a12236058026fd48d0e01c8b7.1441207840.git.patrick.ohly@intel.com>
	<CAP9ODKpmtON87ZkXHP=gecSznBK_GXFAa=gAkicU2p2WV8qavg@mail.gmail.com>
	<CAP9ODKqiej_Nm_4Rrb1J-BWFwSG8hWzLZ3So_BUSKQ-gKWzCjQ@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] initramfs-framework: support mounting rootfs in modules
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
X-List-Received-Date: Thu, 03 Sep 2015 06:29:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-02 at 13:24 -0300, Otavio Salvador wrote:
> On Wed, Sep 2, 2015 at 1:19 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > If there is any limitation please share the use case so we can
> > understand the need for it.
> 
> I found the live module and understood why you want to do this.
> Instead you could use:
> 
> - live as 99-live
> - move finish for 99-rootfs-mount and split as a package
> - put RCONFLICTS and RPROVIDES initramfs-module-rootfs-mount.

So you are suggesting that either "live" or "finish" do the final step
of mounting the rootfs and switching to the rootfs? I actually wanted to
have an initramfs which can be used in the live image *and* on a real
disk and thus would need both, with the "live" module doing nothing
unless booting from the live image.

That's because the initramfs would also contain IMA initialization, and
that is needed in both cases. Maintaining two different initramfs
versions would be an alternative, but then the user and/or script which
does the installation must be aware of the difference. It would also
prevent embedding the initramfs inside the kernel
(INITRAMFS_IMAGE_BUNDLE).

But I'm fine with dropping these two patches for now and revisit the
topic at a later time. I'll remove them from V2 of the patch series.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




