Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UE1ME-0006i0-1z
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 18:45:40 +0100
Received: by mail-ea0-f182.google.com with SMTP id q15so287457ead.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2013 09:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to:x-gm-message-state;
	bh=hjq2TaCpTTYAXEjN57jaW+kyVLpHSRgi/LpltFD9ZLY=;
	b=lVUgvyrSV3umWaF2nTaDwqsBMhtA3+DiiUQnrK1ueRbzECHRUaqF0+5HBPv2uijwMF
	M3zbV8BbQZVlxMLcRntvFueD59SKaHVU5YnCJI32j+XCQ685AOyJY+kV7CjiiycgrdQi
	k7kH1j2KuFm06O8ivPhn1owNpRhgTgf10v8zD2Ww0fKSCE3R6df9l/k+4AbbTtwz5C8/
	pR/c+edu9u/FOakLRiq43SbBJ7I/9mvx0s3GYFB1vQXH+Px2jGtRmRbCRFChjMtofsU1
	lASCWkI+xxj8oggAKAm8REVTzAQIh6YY8mwUIOP9LvwTMtOsSury0ziqlUlk+LSCEAT+
	iddA==
X-Received: by 10.14.220.135 with SMTP id o7mr7871332eep.3.1362763732264;
	Fri, 08 Mar 2013 09:28:52 -0800 (PST)
Received: from ?IPv6:2001:610:612::90e9:51de:26a1:d812?
	([2001:610:612:0:90e9:51de:26a1:d812])
	by mx.google.com with ESMTPS id d47sm8910377eem.9.2013.03.08.09.28.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Mar 2013 09:28:51 -0800 (PST)
References: <1362747705-19277-1-git-send-email-koen@dominion.thruhere.net>
	<513A1B58.4060702@linux.intel.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <513A1B58.4060702@linux.intel.com>
Message-Id: <75A1C3BE-AF4C-4AD2-A950-0EE76E83CD03@dominion.thruhere.net>
X-Mailer: iPhone Mail (10B146)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 8 Mar 2013 18:28:48 +0100
To: Darren Hart <dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQlhFgAdBKUxnelyVQX0Cpnjx0g1xD6dSA1dILAA+zPYAacsUdWe7+M9El7TS5kcTJyFrRmO
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mkefidisk.sh: Cope with translations and modelnames with 'Disk' in it.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2013 17:45:46 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



Op 8 mrt. 2013 om 18:09 heeft Darren Hart <dvhart@linux.intel.com> het volge=
nde geschreven:

>=20
>=20
> On 03/08/2013 05:01 AM, Koen Kooi wrote:
>> The script greps for 'Disk', which doesn't work when your crazy Dutch dis=
tro has parted call it 'Schijf', so force LANG=3DC.
>=20
> Whoopsie :-)
>=20
>>=20
>> The second problem is that 'Disk' might be a substring in the Model entry=
:
>>=20
>> [root@Angstrom-F16-vm-rpm contrib] # parted /dev/sdc  unit mb print
>> Model: SanDisk SDDR-113 (scsi)
>> Disk /dev/sdc: 3905MB
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> scripts/contrib/mkefidisk.sh | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
>> index 38e2217..44ac130 100755
>> --- a/scripts/contrib/mkefidisk.sh
>> +++ b/scripts/contrib/mkefidisk.sh
>> @@ -18,6 +18,8 @@
>> # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA=

>> #
>>=20
>> +LANG=3DC
>> +
>> #
>> # Defaults
>> #
>> @@ -123,7 +125,7 @@ fi
>> #
>> # Partition $DEVICE
>> #
>> -DEVICE_SIZE=3D$(parted $DEVICE unit mb print | grep Disk | cut -d" " -f 3=
 | sed -e "s/MB//")
>> +DEVICE_SIZE=3D$(parted $DEVICE unit mb print | grep ^Disk | cut -d" " -f=
 3 | sed -e "s/MB//")
>=20
> Looks like something like "^Disk /" might be better still?

Not sure, it still fragile either way


>=20
>=20
>=20
>=20
> --=20
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Technical Lead - Linux Kernel


