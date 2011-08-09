Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qqbsh-0005Me-MV
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 04:17:23 +0200
Received: by iyf13 with SMTP id 13so12185814iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2011 19:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=H/Zo1nM7tbgX0gL5t+ukn+qn6tBLVzL6kr9uGe+oqDM=;
	b=AwfGQdN77kJCxVuq1rnzSZNtWLY2uFv8Yk094URSIoxXByFHRuZ9EKgviUjHpgTDCZ
	4fGiaJumQzXaP6NCAXJY6jgUiMGFoWXrFCWRLSoTIqQTWC/4rl6QG45gqbT0S7AmoKY2
	FNnrToWOAEFUxv1kOV3no50Y8Erv8HMql9ZdY=
Received: by 10.231.7.12 with SMTP id b12mr6526817ibb.73.1312855974486;
	Mon, 08 Aug 2011 19:12:54 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q13sm4642167ibi.60.2011.08.08.19.12.52
	(version=SSLv3 cipher=OTHER); Mon, 08 Aug 2011 19:12:53 -0700 (PDT)
Message-ID: <4E4097A3.8090204@gmail.com>
Date: Mon, 08 Aug 2011 19:12:51 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110801 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1312784043-3081-1-git-send-email-raj.khem@gmail.com>
	<1312845842.14274.282.camel@rex>
In-Reply-To: <1312845842.14274.282.camel@rex>
X-Enigmail-Version: 1.2pre
Subject: Re: [PATCH 1/2] shared-mime-info, avahi, polkit: inherit perlnative
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
X-List-Received-Date: Tue, 09 Aug 2011 02:17:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/08/2011 04:24 PM, Richard Purdie wrote:
> On Sun, 2011-08-07 at 23:14 -0700, Khem Raj wrote:
>> Otherwise we end up with configure errors like below
>> 
>> | checking for perl... /usr/bin/perl | checking for perl >=
>> 5.8.1... 5.12.4 | checking for XML::Parser... configure: error:
>> XML::Parser perl module is required for intltool | + bbfatal
>> 'oe_runconf failed' | + echo 'ERROR: oe_runconf failed' | ERROR:
>> oe_runconf failed
>> 
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> We really need to tweak intltool's m4 file so we don't need to add
> in this ton of dependencies unnecessarily...
> 

intltool.m4 uses

AC_PATH_PROG(INTLTOOL_PERL,perl)


if test -z "$INTLTOOL_PERL"; then


   AC_MSG_ERROR([perl not found])


fi



its using AC_PATH_PROG to find perl which is quite right I think.
We somehow have to make sure that the path to perl-native
is added into environment which does not happen unless
we inherit perlnative as of now. and perlnative class is

PATH_prepend = "${STAGING_BINDIR_NATIVE}/perl-native:"


DEPENDS += "perl -native"


are you proposing that we hardcode path to perl-native in intltool
macros and assume that perl-native is already built ? or something else

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


- --
> 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5Al6MACgkQuwUzVZGdMxTdLQCcCEgIWU2zgB5MZ6W2TMItR4ts
cHoAnR9D/n1wTbSjRWWRBzZiO/OxU08i
=tD34
-----END PGP SIGNATURE-----


