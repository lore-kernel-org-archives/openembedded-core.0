Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8E97C71F05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 08:43:34 +0000 (UTC)
Received: by iecrp18 with SMTP id rp18so31726102iec.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 00:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=ZcTxFD2ntpTiKGCf1ifBJ/Duu+hfYbEBFaLHo3T9c6k=;
	b=Ko2RW58AM4//XCvYPI0mNJYU5dWPfFvQcJ6GhEoPcTTKhgKryh7Th9AzQBum2diTpO
	xxaBSZlnksDt8HfMyVnw0X+6fbVYKN3nnCXJP0g3MzV3OhKAENe1vXr6h3akJd9sqc7+
	a8zl2Btk6Xla16X7louoq/Wk0HGGqTOwMEry1GjgRGuECJ6a+Wc11v+HU/m7x9UBMduL
	4wW03DIoH9JPPjQSL5M41TYP6gEOnAuh+/ChEAMCGF6F12AtValsh4/N/US1UymB1HRD
	CE1jqsNB6jGKotftuShhJHCmsIaEvcKXWJUjQSlOidHnFVw16p4EXwIOL+ymAm5DHVah
	5BpA==
X-Gm-Message-State: ALoCoQnmOP1xp1MiykbRn8P+9u23Vjgm3qiCN9HvamN7UGR663XVgz046LPZklvE6jlGVueE5fbD
X-Received: by 10.43.79.129 with SMTP id zq1mr19783304icb.28.1424249015243;
	Wed, 18 Feb 2015 00:43:35 -0800 (PST)
Received: from pohly-mobl1 (p57A57C83.dip0.t-ipconnect.de. [87.165.124.131])
	by mx.google.com with ESMTPSA id u13sm11738488ioi.6.2015.02.18.00.43.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Feb 2015 00:43:33 -0800 (PST)
Message-ID: <1424249010.549.15.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Wed, 18 Feb 2015 09:43:30 +0100
In-Reply-To: <CABcZANmxWG1Vg5L0y8LWG_=WA-BCevD0f_Y_6NhPj_9zq82azg@mail.gmail.com>
References: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
	<CABcZANmxWG1Vg5L0y8LWG_=WA-BCevD0f_Y_6NhPj_9zq82azg@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Feb 2015 08:43:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-02-17 at 08:55 -0700, Christopher Larson wrote:
> 
> On Tue, Feb 17, 2015 at 6:42 AM, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
>         +            # Treat all symlinks to directories as normal
>         files.
>         +            # os.walk() lists them as directories.
>         +            for i, entry in enumerate(dirs):
>         +                if os.path.islink(os.path.join(rootpath,
>         entry)):
>         +                    del dirs[i]
>         +                    files.append(entry)
>         +
> 
> You're deleting elements of a list while you're iterating over it. I'm
> fairly certain that will lead to pain, unless you explicitly ensure
> you're operating against a copy: for i, entry in
> enumerate(list(dirs)):

I was wondering about that myself, but couldn't find any definite
statement about whether it's okay or not for enumerate(). It works in
practice, but of course that doesn't guarantee that it is okay.

Iterating backwards will be more obviously correct, I'll send a patch
update using that.

I'm still curious, though, whether the code above is really broken or
just dubious because one cannot be certain.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




