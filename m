Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 779276B0CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 09:08:09 +0000 (UTC)
Received: by ierx19 with SMTP id x19so47300757ier.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 01:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=+woFQK+3sPdPrrE+k8vksTaXSQifmj1SPyUO42D+RhQ=;
	b=lqAPE72Lgnp2QpYgi7Hk3OohGf8RLThYCdtfWSa2kzOdeNLmFrX+jxgBWQQE9tcP8t
	0+mIrpMTJD9Z7AAksxfXk8jon+tndrG/ckjchyBDSmt24SyyYA3rxyukfj7oRIoK3PIC
	IsPPw7mKcsQNqguo4TC1kE5pYptYeASs+GeamvUt5ZGz8KhfJ1vFbEE61GGhcx+kxAxM
	CsPQ5Cgy6FaHVWb5wkG3zd+CChfzOGiYADNw2XqPobsxwle6YZRLYOryszST2/1xXpnZ
	0x1+ALIMT3niIiTVD/oaeSTp+/1GXw4iES0KQU2k4yAOgYfMMny9zBOyC+LPZRVGv6Ut
	TxSg==
X-Gm-Message-State: ALoCoQnyhv0WRNUZAEBoKyr+OSpT4T7M0JyJFKxYknud+lrr8996IkKIpuj4wVDyNO2Gpo++hrZf
X-Received: by 10.43.78.132 with SMTP id zm4mr34427357icb.81.1424250490802;
	Wed, 18 Feb 2015 01:08:10 -0800 (PST)
Received: from pohly-mobl1 (p57A57C83.dip0.t-ipconnect.de. [87.165.124.131])
	by mx.google.com with ESMTPSA id d1sm11663437igr.20.2015.02.18.01.08.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Feb 2015 01:08:10 -0800 (PST)
Message-ID: <1424250486.549.23.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Wed, 18 Feb 2015 10:08:06 +0100
In-Reply-To: <1424249010.549.15.camel@intel.com>
References: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
	<CABcZANmxWG1Vg5L0y8LWG_=WA-BCevD0f_Y_6NhPj_9zq82azg@mail.gmail.com>
	<1424249010.549.15.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm.bbclass: support packaging of symlinks to directories
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
X-List-Received-Date: Wed, 18 Feb 2015 09:08:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-18 at 09:43 +0100, Patrick Ohly wrote:
> On Tue, 2015-02-17 at 08:55 -0700, Christopher Larson wrote:
> > 
> > On Tue, Feb 17, 2015 at 6:42 AM, Patrick Ohly <patrick.ohly@intel.com>
> > wrote:
> >         +            # Treat all symlinks to directories as normal
> >         files.
> >         +            # os.walk() lists them as directories.
> >         +            for i, entry in enumerate(dirs):
> >         +                if os.path.islink(os.path.join(rootpath,
> >         entry)):
> >         +                    del dirs[i]
> >         +                    files.append(entry)
> >         +
> > 
> > You're deleting elements of a list while you're iterating over it. I'm
> > fairly certain that will lead to pain, unless you explicitly ensure
> > you're operating against a copy: for i, entry in
> > enumerate(list(dirs)):
> 
> I was wondering about that myself, but couldn't find any definite
> statement about whether it's okay or not for enumerate(). It works in
> practice, but of course that doesn't guarantee that it is okay.

The enumerate() documentation says that it is equivalent to a "for in"
loop, and documentation for that says "it is *recommended* that you
first make a copy" (emphasis mine). IMHO it means the behavior is simply
undefined.

> Iterating backwards will be more obviously correct, I'll send a patch
> update using that.

The recommended approach is using a slice copy
(https://docs.python.org/2/tutorial/controlflow.html#for-statements), so
how about this:

# Avoid modifying the list we iterate over, iterate over slice copy
# instead.
for i, entry in enumerate(dirs[:]):
    if os.path.islink(os.path.join(rootpath, entry)):
         del dirs[i]
         files.append(entry)

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




