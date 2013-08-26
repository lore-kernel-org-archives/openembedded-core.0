Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id D49266BA23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:17:49 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb10so3942800pad.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 14:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=tR0JhTtp+Xk2Nleznn419WI+gImYGW49H7CpZdytyXw=;
	b=X3mpVer1YJRNZ9MKxROvwGJcZVxpQ39cpqFFLsz/eK89Lj546HVY/nPEG4iRQYVXxU
	0R9rvT6dsT8esCGp146GQqeW7feXaM8Rmf3bpx5xxM+QQbrNWPTVtB013BUEwqHXyWGL
	GGs9/0aVd7dlEil8zIpBWoO8zhJr2ZrJLVAjNSO9gn5r/2dxgjYCQY6u1yc+dk/FHFS6
	W1zE0yIhNkm0QsUEUfSFr7Xy00nwunDD5zIxwMEOJzWTucp3zCof0OqnNg6XKVBbP05Q
	RF9Nyhj5HFwqKaLSwVutlB6LqAadEsHSDeXUQKFTKoo60697fmCcT/BHr97ZyExRrW/z
	yGEg==
X-Received: by 10.68.250.5 with SMTP id yy5mr17537370pbc.93.1377551869809;
	Mon, 26 Aug 2013 14:17:49 -0700 (PDT)
Received: from edchang-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ht5sm20033015pbb.29.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 14:17:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <8A6F622D-40C7-4598-91BE-B4E62F2EA6D3@gmail.com>
Date: Mon, 26 Aug 2013 14:18:01 -0700
Message-Id: <67502003-5172-4343-9A0D-2AC7B6E5D111@gmail.com>
References: <1377510661-14290-1-git-send-email-riku.voipio@linaro.org>
	<8A6F622D-40C7-4598-91BE-B4E62F2EA6D3@gmail.com>
To: Riku Voipio <riku.voipio@linaro.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix directory cleanup for 2.17
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
X-List-Received-Date: Mon, 26 Aug 2013 21:17:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 26, 2013, at 10:32 AM, Khem Raj <raj.khem@gmail.com> wrote:

>=20
> On Aug 26, 2013, at 2:51 AM, Riku Voipio <riku.voipio@linaro.org> =
wrote:
>=20
>> Commit e0c2dd275827a4b37b8116d0f0119333638461af broke building
>> eglibc 2.17, which still ships pt_chown under eglibc/ directory.
>>=20
>> Fix by only deleting directory when pt_chown is not there.
>>=20
>> Cc: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/recipes-core/eglibc/eglibc-package.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc =
b/meta/recipes-core/eglibc/eglibc-package.inc
>> index c36d16c..3adf1a9 100644
>> --- a/meta/recipes-core/eglibc/eglibc-package.inc
>> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
>> @@ -75,7 +75,7 @@ do_install_append () {
>> 	rm -rf ${D}${localstatedir}
>>=20
>> 	# remove empty eglibc dir
>> -	if [ -d ${D}${libdir}/eglibc ]; then
>> +	if [ -d ${D}${libdir}/eglibc -a ! -e =
${D}${libdir}/eglibc/pt_chown ]; then
>=20
>=20
> I think its better to use  --ignore-fail-on-non-empty option to rmdir

oh well just realized that this patch was committed as it is so you can =
ignore this suggestion.


