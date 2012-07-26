Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SuSlt-0006pL-Cg
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 20:26:49 +0200
Received: by lbol5 with SMTP id l5so1476661lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 11:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=O2fSPLojmQbyA7XFMumtMn0MP+rCzJuU5Y1dZAW6X4A=;
	b=c0dmJKknLbN5kRhmbGfQPy1Nbrswje0W9vg2nrIU/PnMpUptgtenNeSmmChcAjrhRu
	4VeQPhnwSgoV10Q6neNh3XzDDVcgfPWWJM8HfJER2UApVomRKonhVumepRTONXV4E5RT
	uZ2TyAlyWzft1FQbJQAZTXzYzZ8twtb1s1ar93bAHHpUe9mNlskTLJmB9Le2Q55ByqjO
	aXskVbVC+llroqJwx2IuzX7t8rT0f2lOgjh1kKX/i/UzeDN5Pqvptp0OIA1iWcAAHpRD
	l3Up8zdegZLAMevY/1opRofdB4kUJaTBuIZ57xiKjltFOkrsYnyN108FLvlG4JBeANXu
	eleg==
Received: by 10.112.30.41 with SMTP id p9mr149830lbh.26.1343326518303; Thu, 26
	Jul 2012 11:15:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Thu, 26 Jul 2012 11:14:58 -0700 (PDT)
In-Reply-To: <50117246.2030502@windriver.com>
References: <D9D7124626ED1E43963D86B2657D5CCD03A69B7A@FRSNPREXC1.usr.ingenico.loc>
	<50117246.2030502@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 Jul 2012 11:14:58 -0700
X-Google-Sender-Auth: nDMXgSORJHk9AgGsP1fkTxhh120
Message-ID: <CABcZAN=nH-rkHyVm8QwaFMyXmGPe=H3cAkM0kJkPsMLp82PEKw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: SDK and external toolchain
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
X-List-Received-Date: Thu, 26 Jul 2012 18:26:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 26, 2012 at 9:37 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> index 44284c3..f5fd4d7 100644
>> --- a/meta/classes/toolchain-scripts.bbclass
>> +++ b/meta/classes/toolchain-scripts.bbclass
>> @@ -136,7 +136,7 @@ toolchain_create_sdk_env_script_for_installer () {
>>   #we get the cached site config in the runtime
>>   TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
>>   TOOLCHAIN_CONFIGSITE_SYSROOTCACHE =
>> "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
>> -TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
>> +TOOLCHAIN_NEED_CONFIGSITE_CACHE = "ncurses"
>
>
> That is incorrect.. the CONFIGSITE_CACHE should be generated for the TCLIBC.
> If you don't do that, then you will be running the same configure steps --
> looking for basic glibc information over and over and over, causing a fairly
> expensive performance penalty.

No, he's right, this is a bug in toolchain-scripts.bbclass. We could
work around it in the recipe via RPROVIDES_${PN}, but
TOOLCHAIN_NEED_CONFIGSITE_CACHE feeds directly into task 'depends', so
it's pulling in ${TCLIBC} explicitly rather than the more accurate
'virtual/libc'.
-- 
Christopher Larson


