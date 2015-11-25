Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 91E396057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 22:31:36 +0000 (UTC)
Received: by wmww144 with SMTP id w144so246890wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 14:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=u/eld7/uPwxdWvFAoakABJHs3YkxAkBZJKX/UVfE0wE=;
	b=QRjPDViCxPZuy6gx+R7zolmVisLalMmbXW8UljcjQR5pewzbcU6RiQOgvlzS4IhkKE
	J95U7eP/09s/lem6DfGFt3lvocah6xvwIkZd9bfs9ugYxuQiqV6TU4MQCO/eOwgB8noS
	N/xnk1DvarzADSfmG2lNi7Z20MgVgBKGpPNCdeQyeUJcYQcBC6dQIidfTKUmSln3gAW4
	m+YfmtHbz88Ozq+erRaIF7+CTeaclVZyghaegLJLSbV4bA6yp2pAzOHsukzF9KapiT0l
	1ugHBaqOHRdW4Zxoi/sgfSsl+AxSZYxLGSokotwd6888hG+J2W+bSUCEN3MTFUl0xunA
	UARA==
MIME-Version: 1.0
X-Received: by 10.194.200.134 with SMTP id js6mr52610254wjc.114.1448490696922; 
	Wed, 25 Nov 2015 14:31:36 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Wed, 25 Nov 2015 14:31:36 -0800 (PST)
In-Reply-To: <CAJTo0LbLQ51w5+MDkXKyFvDzzz=8UFjDi-s=JyHy2WoFFx2y2Q@mail.gmail.com>
References: <CAJ86T=VBh-TsnaSyNVSxmbEJz7TbFcDmNBVP4_4PhXB=YMrm5w@mail.gmail.com>
	<CAMKF1spXxarTUskBgB6ABdL-yn4wSm1cOZSBKdCpyxQzDg_a8g@mail.gmail.com>
	<CAJ86T=X_r_OU1RfN8nYJAJSYXwqEgvK17Hn87_+AfoGQAn2ocw@mail.gmail.com>
	<CAJTo0LbLQ51w5+MDkXKyFvDzzz=8UFjDi-s=JyHy2WoFFx2y2Q@mail.gmail.com>
Date: Wed, 25 Nov 2015 14:31:36 -0800
Message-ID: <CAJ86T=UWW0ZZYHSUR46TsFcFqVYr89TRRhJso1_x10DnaLr-8Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: vmdk images with musl libc
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
X-List-Received-Date: Wed, 25 Nov 2015 22:31:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 25, 2015 at 1:56 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 25 November 2015 at 21:40, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> So would it be correct to add exactly those lines to the oe-core mtools
>> recipe?
>
> Yes.  Pretty much every dependency on glibc-gconv* should be guarded with a
> libc override of some sort.  There's an open bug to give locale packages
> virtual names so this isn't a problem anymore, I should do something about
> it!

OK, just to be absolutely sure I understand, mtools RDEPENDS is currently:

  RDEPENDS_${PN} = "glibc-gconv-ibm850"

Potential solution 1:

  RDEPENDS_${PN} = "glibc-gconv-ibm850"
  RDEPENDS_${PN}_libc-musl = ""

Potential solution 2:

  RDEPENDS_${PN}_libc-glibc = "glibc-gconv-ibm850"

Which one is correct?

Solution 2 is more invasive, since the _libc-glibc over-ride would
mean RDEPENDS gets ignored completely for mtools-native, right?

