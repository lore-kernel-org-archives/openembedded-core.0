Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QWQzI-0006AI-EF
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 12:36:48 +0200
Received: by fxm19 with SMTP id 19so4254588fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 03:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=VDtmTxVB6h6b49+9VNQLDGIRNVCTIwPPNLkkYGd/xiQ=;
	b=GUDwk65BwIGkN2tmF0ZFSCmR2hZE9LCkb/yl6+YBOST7LB1wpFZx+aBuARibsSnH6r
	rlqu+37j3g6WAwpBe1+1R0nuSc3Mp9DRHNd32g+BZE/iXa5eWPi/tIO091JXVqFBjbfA
	tSRQjnFP2GBwXphVP9hpi3B2G3CYq+V3XEP+Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=Bxe1X8Natmxbc8vVt47oKXUhmecs6u9oeQyUS/tNIEorMnWvp1TDOW+zHTPHAnJJc4
	KqY0iIYigtMapqM7CPGewhQWsXvH4MqlAqQp0TVwMKKf37uUKZ6YPcNwykuTw60WIZev
	GUXsOsu0fo5q95ar5gP6SpR++67oDucDNAgUk=
MIME-Version: 1.0
Received: by 10.223.64.66 with SMTP id d2mr1385813fai.116.1308047602682; Tue,
	14 Jun 2011 03:33:22 -0700 (PDT)
Sender: anders.darander@gmail.com
Received: by 10.223.109.19 with HTTP; Tue, 14 Jun 2011 03:33:22 -0700 (PDT)
In-Reply-To: <BANLkTi=u8pJ=pkgmWLuPnqKNjRow18X70A@mail.gmail.com>
References: <1307985976-22648-1-git-send-email-anders@chargestorm.se>
	<BANLkTimkU94WYhGGac5P88GMUA6mk7NCKg@mail.gmail.com>
	<BANLkTikkaDK6122A-=H+TS01oTsAtfD2qg@mail.gmail.com>
	<BANLkTi=u8pJ=pkgmWLuPnqKNjRow18X70A@mail.gmail.com>
Date: Tue, 14 Jun 2011 12:33:22 +0200
X-Google-Sender-Auth: 9TOxEjDxOxgaryPP9B3hSTqjxYE
Message-ID: <BANLkTimyQdXV9Fxp8EuAfEWfX2=eGt=O+Q@mail.gmail.com>
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: take TMPDIR from bitbake
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jun 2011 10:36:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 14, 2011 at 11:25, Yury Bushmelev <jay4mail@gmail.com> wrote:
> 2011/6/14 Anders Darander <anders@chargestorm.se>:
>> On Tue, Jun 14, 2011 at 00:22, Yury Bushmelev <jay4mail@gmail.com> wrote:
>>> Getting some variable from bitbake is frequently used task. May be our
>>> bitbake people will add some special mode to bitbake for this? E.b.
>>> like bsd make have (make -V KERNCONF)[1].
>>>
>>> I would suggest syntax like 'bitbake -V TMPDIR'
>>
>> That would definitely simplify a few lines in a number of scripts.
>
> Note that user may request more than one variable with single bitbake
> invocation. E.g.:
>
> bitbake -V TMPDIR -V DEPLOY_DIR
>
> In this case better to prefix variable value with name, like set does:
>
> TMPDIR=/path/to/tmpdir
> DEPLOY_DIR=/path/to/deploydir

The question is, how often do we assume that multiple variable will be
requested?

Sure, if we need multiple variables, we'll save time by only invoking
bitbake (and parse all configs, etc) once. On the other hand, have we
then gained anything, as compared to 'bitbake -e'? Sure, we'll reduce
the output, by only outputing the requested variables... But in the
original case: TMPDIR=`bitbake -e | grep TMPDIR=\" | cut -d '=' -f2 |
cut -d '"' -f2`
the only change we can do is to substitute 'bitbake -e' with 'bitbake
-V TMDPDIR', which wouldn't be any improvement.

Or should `bitbake -V TMPDIR` only output '/path/to/tmpdir', and
`bitbake -V TMPDIR -V DEPLOY_DIR`output
TMPDIR=/path/to/tmpdir
DEPLOY_DIR=/path/to/deploydir
i.e. only prefix the variable value if more than one variable is requested?

I'd like `bitbake -V TMPDIR` to only output the value, as otherwise we
can just use `bitbake -e` anyway. If we make  `bitbake -V TMPDIR` only
output the value, then the question is should we only allow a singel
'-V VARIABLE', or should we accept multiple variables, and then prefix
the values?

Regards,
Anders


