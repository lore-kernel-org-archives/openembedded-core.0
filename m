Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 56B4D7391C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 16:43:06 +0000 (UTC)
Received: by pacwe9 with SMTP id we9so69624480pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 09:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ZXeGqO50H1ppsqYUFtujTwjQCcN7+99p0yneVkvSLUs=;
	b=WyrGfIUk0nePsYmlVibebWmK5geYlr+wkEycrwcxzzsCU3i80YfgycvU2bL4ZCnKkH
	U0lPdc40d8vwHn0F50nSez+5Lbvy/4sl3m0fuVY06GGXBJT6pr44cOj7Sac5aGkBxsgS
	uyV4dryxwmF2TJTEAlhPdDf5fcpuksaKGUsWgtEH5pXml6wASwcZWadlzluwlxDQtFGC
	1hQ+uLT/bukOYKq4QzPiOWtmmYTe8K2fpIMhJuyyyOSVkn0QaJzE9buQ+PjvPqwQsxPO
	xX8tEfhiF/DvWpSZYsII6DO1Cwhsz1OmaaevIyhwsHTr+0ZuB7vApxOQgNlPCmFf9ugW
	o7PA==
X-Received: by 10.66.185.230 with SMTP id ff6mr141058153pac.102.1426524188029; 
	Mon, 16 Mar 2015 09:43:08 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:1d43:cf03:319c:2e61?
	([2601:9:3580:84c:1d43:cf03:319c:2e61])
	by mx.google.com with ESMTPSA id
	d13sm11475717pdj.92.2015.03.16.09.43.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Mar 2015 09:43:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAC1BbcS+CutVKhSgx16ii7c_eMrszoA3QS5itBa80AbWFN+RdA@mail.gmail.com>
Date: Mon, 16 Mar 2015 09:43:06 -0700
Message-Id: <DA889C06-A8D0-4B7C-A790-E70A2C504614@gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
	<73D5E895-8D8E-445E-B269-68F62A89B413@gmail.com>
	<CAJTo0LZvk3Y7ZuN1pX7ES2iGFThRLE_0w=w904xVVkupmCJULA@mail.gmail.com>
	<CAC1BbcS+CutVKhSgx16ii7c_eMrszoA3QS5itBa80AbWFN+RdA@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 16:43:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 16, 2015, at 9:37 AM, Bernhard Reutner-Fischer =
<rep.dot.nop@gmail.com> wrote:
>=20
> On 16 March 2015 at 17:26, Burton, Ross <ross.burton@intel.com> wrote:
>>=20
>> On 16 March 2015 at 18:24, Khem Raj <raj.khem@gmail.com> wrote:
>>>=20
>>> Patches are fine in this series, however I just want to set the
>>> expectations right here. While having that libc-independent goal is =
fine.
>>> Sometimes we just can not do it, since uclibc or musl
>>> does not have all the features that glibc has and an app might also =
be
>>> using it.
>>> making glibc users not have those features is unfair
>>> given that we have a strong mechanism of overrides in OE, it should =
be
>>> used to this advantage.
>>=20
>>=20
>> But these patches, which add configure options to enable/disable the
>> relevant functionality and have been sent upstream - represent the =
ideal
>> case as once they're merged won't cost us any effort in the future.
>=20
> I just disable NIS / YP for uClibc and leave glibc (or any other libc
> for that matter) to do what they previously did.
> libtirpc is an excellent example for this unchanged behaviour:
>=20
> src/getrpcent.c:        if (!__yp_nomap && _yp_check(&d->domain)) {
>=20
> and i did not change that since first, i don't care and second, maybe
> glibc-users do fun stuff to let _yp_check resolv to the proper
> __yp_check, i don't know nor really care ATM.
>=20
> I think uClibc-users do not expect to have NIS support, we never
> implemented Yellow Pages support since that is usually way out of
> scope for those setups.
>=20
> Maybe i misread your comment, though, Khem?
> Or do you refer to a glitch i introduced? If so, what did i botch? :)

patches are fine. I was merely pointing on the sweeping statement =
regarding patches should be always libc-independent.

>=20
> thanks,


