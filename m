Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id EB3F673F97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 16:03:58 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so43988553igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 09:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=zuvswqDxdDDQX+WvSgtZuV1Rgt9cdVDjosfUHDdEQjI=;
	b=LyNNS6629CwdWx5qUgEAsKOP7poxCtVehjRbyEFUT9J+AkCZRM6orJg9e5cjUlku1f
	RmY/GRSlDV4IzoHzeHpypLwcyFbm4+ppU/d2F54/SmcPkuC6q0oyWSnSIJIDbW1/7h2/
	hmdJ6asyW9s1HQ274E8+xagPmSyrl9bgvEbbTidzGPFGcJ28eMg4V+Y73qz7QtcLI5Qd
	kSihrjMqsyXUom9lWF6ZmFm9BFHzJousbdoT/eupU2EPWpTqUc3/4fVJiwLddZAeoqck
	pbjVTypgKrrVAHh/fUxk2HzMAJOKcx3fHQN9s+KVnYNRNxp+v9dDC7Y7CuncBQaEqDX9
	xzuA==
X-Gm-Message-State: ALoCoQkbIL/lWs++6mxxilyNCgWiRJIeIFaRMd7RJm2h0ph3EfxSxA6pRPfZ5lqZVL9UaJG6d73Q
X-Received: by 10.50.12.34 with SMTP id v2mr5000209igb.69.1440605038678;
	Wed, 26 Aug 2015 09:03:58 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F619.dip0.t-ipconnect.de. [93.232.246.25])
	by smtp.gmail.com with ESMTPSA id
	q79sm18238328ioi.0.2015.08.26.09.03.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Aug 2015 09:03:58 -0700 (PDT)
Message-ID: <1440605035.20082.20.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>, Mark Hatle
	<mark.hatle@windriver.com>
Date: Wed, 26 Aug 2015 18:03:55 +0200
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAFC716948@ALA-MBB.corp.ad.wrs.com>
References: <1440280746-11401-1-git-send-email-andrea.adami@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAFC716948@ALA-MBB.corp.ad.wrs.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mtd-utils: disable xattr if DISTRO_FEATURES	doesn't contain acl
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
X-List-Received-Date: Wed, 26 Aug 2015 16:04:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-08-26 at 09:50 +0000, Huang, Jie (Jackie) wrote:
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-
> > bounces@lists.openembedded.org] On Behalf Of Andrea Adami
> > Sent: Sunday, August 23, 2015 5:59 AM
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v2] mtd-utils: disable xattr if DISTRO_FEATURES doesn't contain acl
> > 
> > After commit 24fde4d do_compile fails:
> > 
> > | mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or directory
> > | #include <sys/acl.h>
> > 
> > This is a missing dependency on acl.
> > To fix this we add a check to disable xattr when acl is not in DISTRO_FEATURES.
> 
> I think you should check the xattr distro feature, but only checking the DISTRO_FEATURES
> can't ensure the dependency satisfied, why not use the PACKAGECONFIG, something like:
> 
> PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)}"
> PACKAGECONFIG[xattr] = ", -DWITHOUT_XATTR,attr acl,"

I agree that we should check the xattr distro feature. The actual patch
is a bit more complex, though, because PACKAGECONFIG cannot influence
EXTRA_OEMAKE, can it?

I'll reply with a patch that worked for me.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




