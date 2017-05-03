Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id BF29971A05
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 11:53:32 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id c15so65521864ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=9HhcRXFdBWc7NFd8RpdiXh0lnXjslhEWpbAmCmYvcx0=;
	b=Ix/0Kws4V49RgsmSfXlh738F9PDAuJbnry3Iq7cBmlrQAete74VI9v1BaAhvEOI+FY
	PUTYZ41FiXqVGlCZUDbK5aRVBvQPH5myv70ybDFkmtL9sQVr4s/sVwpQza+2spka9gAp
	0C0k6I8jMzW3+dBTPL2kmEjnAWECiYr1dnAh8D9mh3Ve54eJAT8qmyQ/PH2BkJEsG/f4
	ga4DnmRqNUKbr+P+HEt7X1RTLJl38yGFxWGuLPyYEFNO2LPgNKkERUIaYjfSqbG2U1Pi
	DWnlMwsqDAwhBtt3RsyEREJWbFTBp/jfMdRzzLs3m5Bcj4CTi+cOO3NawqCojocRvJSx
	zW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=9HhcRXFdBWc7NFd8RpdiXh0lnXjslhEWpbAmCmYvcx0=;
	b=IqEx1ZrxkUcnr10LPP3Jjv19gVQ7Nkc/NYMMUhMNRW4yC53Ny6aAsgWOl9HgzvSjtg
	w05ILWelnl8XqngITjPVhryaOIryjTPB7OLZAocm+qHgZxSMgNgfIUApggnOfEg6uK34
	HBnfJYHpkVO1H8orcrbts17xDEbZ1QjaowOspcBZxBTjJsvfCutMzwyylLOvLwTjDzgt
	It0h4EQligpY5SbOB0W8Ucg2t3cXzMJmnTUeuXPVDbfLrSC8RNWiKUHJVhJc6Enz5CZJ
	L3UOdelW2vX+T71MKp7HMW72QTBvyxmIAwQZGqXlsglUDfFCC3YDBgXnJppgbku2dhY6
	1NgA==
X-Gm-Message-State: AN3rC/7M7Ibr0VI3+rgxPRZ4zjVjm64YkT5xg1FAKFtsKYojJU/7mHoP
	i/6R90VxxrjcrvBV
X-Received: by 10.36.19.193 with SMTP id 184mr124048itz.93.1493812413733;
	Wed, 03 May 2017 04:53:33 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CE40.dip0.t-ipconnect.de. [93.232.206.64])
	by smtp.gmail.com with ESMTPSA id 139sm9244115ioz.2.2017.05.03.04.53.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 May 2017 04:53:32 -0700 (PDT)
Message-ID: <1493812409.4241.247.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 03 May 2017 13:53:29 +0200
In-Reply-To: <1493810039.23535.57.camel@linuxfoundation.org>
References: <aec82a5d8c1b622749a12bea2c478a8ff7f363b1.1493808889.git-series.patrick.ohly@intel.com>
	<1493810039.23535.57.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] QemuRunner: avoid tainting os.environ
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
X-List-Received-Date: Wed, 03 May 2017 11:53:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-05-03 at 12:13 +0100, Richard Purdie wrote:
> Why not pass in an env to the subprocess call in launch()?

Then it wouldn't get logged. Not a particularly strong argument, though.
If that's preferred, I can change the implementation.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




