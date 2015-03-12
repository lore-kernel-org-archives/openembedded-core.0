Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 74F08738B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 07:21:56 +0000 (UTC)
Received: by padet14 with SMTP id et14so18195352pad.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 00:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=mWHY4KsQzVYElhZqiCp3jUjc2zFEMiHGkvLT8HKI2Pg=;
	b=lmOJLke2M9w3c3Uo3DtC0NWlx7vClsIB3jp9/rpGewNrcVo4nmv20FvxhngE7cwU+x
	5nXQ7OBauMhXCtOtkQFYXNwelEli+ogmJdxMa0SIJQAb95Oe5sjmabgSbHsz0OsAdlcm
	lRi8V0Viooq4D5DYX9NxbmOF3PKNsDqgIzh+Bb0c71hA7FkbTUUgQPoNWZTHBD86PQHf
	yMXsLIcaqe3GSXS3z2j6ua5MUGlQigzhKrxYr2usrkjlJnjiqKcc2DqgcE5LiPEd4PKc
	IqkW2TOGEaRc53nskifAnz1Gc/sPK87QzMJNR9YyJoh2pIqhpW5FgX1u0t00Cu1GfYyx
	EW+A==
X-Received: by 10.66.62.201 with SMTP id a9mr87215920pas.101.1426144917921;
	Thu, 12 Mar 2015 00:21:57 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:24c5:b426:3d6b:ff44?
	([2601:9:3580:84c:24c5:b426:3d6b:ff44])
	by mx.google.com with ESMTPSA id
	oa12sm3191582pdb.91.2015.03.12.00.21.57
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Mar 2015 00:21:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55013CDD.3050708@windriver.com>
Date: Thu, 12 Mar 2015 00:21:55 -0700
Message-Id: <1C1D4049-981D-4FA6-AC57-7F1AA5B45125@gmail.com>
References: <1425957930-8061-1-git-send-email-net147@gmail.com>
	<55013CDD.3050708@windriver.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Thu, 12 Mar 2015 07:21:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 12, 2015, at 12:14 AM, ChenQi <Qi.Chen@windriver.com> wrote:
>=20
> On 03/10/2015 11:25 AM, Jonathan Liu wrote:
>> The ownership needs to be explicitly set otherwise it inherits the =
user
>> and group id of the build user.
>>=20
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  meta/recipes-core/systemd/systemd_219.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd_219.bb =
b/meta/recipes-core/systemd/systemd_219.bb
>> index 24486f1..6a4f4e8 100644
>> --- a/meta/recipes-core/systemd/systemd_219.bb
>> +++ b/meta/recipes-core/systemd/systemd_219.bb
>> @@ -147,6 +147,8 @@ do_install() {
>>  		sed -i =
s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% =
${D}${sysconfdir}/init.d/systemd-udevd
>>  	fi
>>  +	chown root:root ${D}/${localstatedir}/log/journal
>> +
>>          # Delete journal README, as log can be symlinked inside =
volatile.
>>          rm -f ${D}/${localstatedir}/log/README
>> =20
>=20
> I think it should be root:systemd-journal.
> What do you think?
>=20
> And this patch would also fix the following bug.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7293

/var/log is symlinked (its not a copy-bind) into /var/volatile/log and =
/var/volatile  is mounted as tmpfs on runtime as of now
so how is this patch helping out with anything ?=20

>=20
> Regards,
> Chen Qi
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


