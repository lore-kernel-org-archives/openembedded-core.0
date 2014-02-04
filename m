Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 1266A6E944
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 15:40:48 +0000 (UTC)
Received: from [5.5.8.242] (192.168.201.202) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.158.1; Tue, 4 Feb 2014 16:40:47 +0100
Message-ID: <52F109FE.20806@enea.com>
Date: Tue, 4 Feb 2014 16:40:46 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>, =?ISO-8859-1?Q?David_N?=
	=?ISO-8859-1?Q?ystr=F6m?= <david.nystrom@enea.com>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>	<52EFA891.7060806@enea.com>
	<20140203164718.GA5112@lpalcu-linux>	<52F0F464.5060107@enea.com>
	<52F0FDF5.8000603@enea.com> <20140204153414.GD5112@lpalcu-linux>
In-Reply-To: <20140204153414.GD5112@lpalcu-linux>
X-Originating-IP: [192.168.201.202]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/49] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Tue, 04 Feb 2014 15:40:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2014-02-04 16:34, Laurentiu Palcu wrote:
> On Tue, Feb 04, 2014 at 03:49:25PM +0100, David Nystr=F6m wrote:
>>
>> Oops, bug on my behalf in above example, but it still fails the same
>> way when using a correct IPK_FEED_URI.
>>
>> IPK_FEED_URIS +=3D " \
>>             all##file:///media/sdb5/repo/build/tmp/deploy/ipk/all \
>> 	   ${MACHINE}##file:///media/sdb5/repo/build/tmp/deploy/ipk/${MACHINE} =
\
>>
>> ${TARGET_ARCH}##file:///media/sdb5/repo/build/tmp/deploy/ipk/${TARGET_AR=
CH}
>> \
>> 	   "
> Ok, I succeeded to check this in master. Apparently, I understood this
> wrong. In my tests I was deleting the tmp/ and sstate-cache/ and I was
> not expecting the target packages to be re-built. It turns out that this
> entire process takes place but when the rootfs is created, the provided
> feeds are used... I learned something new today! :)

Yes, if you only run bitbake -c rootfs core-image-minimal, no target=20
packages _should_ be built.
It so happens that a few will still be built, for unknown reasons. But=20
this should be considered a bug.
native and cross packages will of course be built regardless.

> Regarding the refactored code, indeed, it does not work in this case. It
> always tries to create the index files in the deploy/ipk directory
> before continuing with the rootfs creation. I guess a condition should
> be added in the new code to check for BUILD_IMAGES_FROM_FEEDS and skip
> the index creation step... Shouldn't be hard to fix.

Thanks Laurentiu.

> laurentiu
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


