Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6DD7838A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:47:25 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id x187so45605932oig.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 00:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=ZWDqO+Ivcml8sY5UbFMEbSH9HbMdRIHSq1AE/lBDIrs=;
	b=evSlUzQw7h2O7XoT3BExQHRdu9POpRhzapP8R7rnaZ/7wMO+sdqZsyJVXAFTQgOsl7
	6la8C6EzrKotRSO3s7+vfahsOLa4AoTxeJuki6CQt4eBcbfQZ7pL5QeuV6vzC4SJKU23
	TEk3UV0qEM5kcG/n7RaI2MEGaoN//qCamLd6YP0eZ2pgco7flzs5CwEOWCUDT2NgN2jc
	CQlkrQmJxARMlfjjaciu+n0D6hnZ0BzatmDb4CHL+dA+3HuK5vuWp8vmTywBdWmplghp
	CcHrYRpbOb7n5/MOln21dl2uprDVFIxf9Ic8lAKY4Oo8FIn6FRaaRbigvEz+/dVNUe6r
	LPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=ZWDqO+Ivcml8sY5UbFMEbSH9HbMdRIHSq1AE/lBDIrs=;
	b=eY3trL6WxpReHfr4zBkQ9G7WkJjHPNj90P8YezLBmSAcvS3WiJ4ERUNrov8jY8Z3u+
	3Qp4+2E2vNQIslt9oaKtEAHdmTZPduvO6to6fncJQQwkJUNOJ+7yWxJr0a1giDZSHNbg
	bzV2Pj97wB+r8fLmMrOqTqLM2+Zvl2u5m1zc/nfujZMHcl+HtQx+jiET/gy/WAvK9ivi
	Q889w4K8oBePvw4l3LurXt6u0QaGOc9nJ0/qgc64HqoZXCUu3xsy9Ff2dc8GAjBTDT/K
	6x01a14TTaMvH6wg3pbN8zLThx9wXGo0NB4xuHhw6JBnnF1uTvkDyIjHiJXaBeU8xFDl
	uKGA==
X-Gm-Message-State: AIVw110038qCtQ+r610ADLbNj4cjFcfSUqsdPGYemUUg0ew3VAfSpHe0
	KqTf6DU6rQH7azzURWE=
X-Received: by 10.202.87.78 with SMTP id l75mr1437932oib.275.1500623246542;
	Fri, 21 Jul 2017 00:47:26 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C109.dip0.t-ipconnect.de. [93.232.193.9])
	by smtp.gmail.com with ESMTPSA id
	q10sm1341859oif.44.2017.07.21.00.47.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Jul 2017 00:47:25 -0700 (PDT)
Message-ID: <1500623241.15277.10.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Tom Rini <trini@konsulko.com>
Date: Fri, 21 Jul 2017 09:47:21 +0200
In-Reply-To: <1500590631-2028-1-git-send-email-trini@konsulko.com>
References: <1500590631-2028-1-git-send-email-trini@konsulko.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image-vm: Convert vmdk/vdi/qcow2/hdddirect images to IMAGE_CMD
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
X-List-Received-Date: Fri, 21 Jul 2017 07:47:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-07-20 at 18:43 -0400, Tom Rini wrote:
> The support for writing vmdk/vdi/qcow2 images has not been converted to make
> use of the IMAGE_CMD infrastructure and instead relies on custom logic for
> adding tasks in the right place.  Convert these images to making use of
> IMAGE_CMD.

Thanks for working on this. I still have
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10204 open for
enhancing vmdk/vdi/qcow2.

However, your patch doesn't go as far as described in that bug, does it?
Instead of allowing, for example, IMAGE_FSTYPES = "wic.vmdk", it merely
changes how IMAGE_FSTYPES = "vmdk" is implemented.

The current patch has its merits as it simplifies the implementation,
but I think it would be worthwhile to go all the way, even if it changes
how images are going to be named.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




