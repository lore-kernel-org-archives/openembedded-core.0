Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2EEB1601AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 11:51:29 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id t11so543992lbd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2013 04:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ct0Py1tHh6B2QKNJCsiQyxnSUWOMB2NxMhXQtlxBL/M=;
	b=oqtQX2S7K02c/lOaJ+lG3xRAGbS/4sHYQkBRmht3yQm/MtHEcL3JmZL0KGN7pTGqaT
	0oA5fDpE+TcGAw5VTlQ1gRslqCOL4hrSoacdCuJIJUqG736F2d0UmCngBZIXXK4F9kBz
	Kvbm0GTIlUMkztu/gbr0sUQXzEkDqvJAZ4JCTd1x2mglAq6wZRULkI1X3IQDdrg2rpqH
	yzbPdmlo7hS33I6rwWaX+Az78czCblTgeIehUGOxgJZh+NGGkLn+7p14XNV5P6ER56ij
	AlGjW/+IiDJiO4I+7L48JTOTssgw2AcjE+7Nhs9r8S4jfyn4JW8pj0bauw2frR++OvWB
	6Gbg==
MIME-Version: 1.0
X-Received: by 10.112.190.69 with SMTP id go5mr10311052lbc.130.1370346689202; 
	Tue, 04 Jun 2013 04:51:29 -0700 (PDT)
Received: by 10.112.147.233 with HTTP; Tue, 4 Jun 2013 04:51:29 -0700 (PDT)
In-Reply-To: <CAAQYJAudR_UYhKXmb3Qxowm8_b8mnC7nyeB3kA-4MUeQ4QiGdw@mail.gmail.com>
References: <1369524182-994-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAudR_UYhKXmb3Qxowm8_b8mnC7nyeB3kA-4MUeQ4QiGdw@mail.gmail.com>
Date: Tue, 4 Jun 2013 13:51:29 +0200
Message-ID: <CAAQYJAv9GTpL=MgYRsc-idhS+M8LzvwJN9A4x0KMjmJ+rmbE=w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cramfs: import recipe from meta-oe
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
X-List-Received-Date: Tue, 04 Jun 2013 11:51:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Note there would be also the possibility to use the mkfs.cramfs
provided by util-linux implementing changes in image_types.bbclass and
util-linux itself.

Seems a bit overkill to me but still an option...

Andrea

On Tue, Jun 4, 2013 at 1:39 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> ping
>
> Recipe is rather stable (tarball of v.1.1 dated 2002) and cramfs can
> be handy for read-only images on legacy devices.
>
> All the needed infrastructure is already present in
> image_types.bbclass so I'd say this recipe has been mistakenly
> forgotten when splitting out oe-core
>
>
> Andrea
>
> On Sun, May 26, 2013 at 1:23 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> * though listed in IMAGE_FSTYPES the helper is missing so
>> * make oe-core autosufficient importing the recipe.
>> * Fix PN -> BPN to avoid fetch errors with cramfs-native
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  meta/recipes-support/cramfs/cramfs_1.1.bb | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 meta/recipes-support/cramfs/cramfs_1.1.bb
>>
>> diff --git a/meta/recipes-support/cramfs/cramfs_1.1.bb b/meta/recipes-support/cramfs/cramfs_1.1.bb
>> new file mode 100644
>> index 0000000..0bca0e1
>> --- /dev/null
>> +++ b/meta/recipes-support/cramfs/cramfs_1.1.bb
>> @@ -0,0 +1,29 @@
>> +DESCRIPTION = "Builds cramfs filesystems for embedded systems"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>> +DEPENDS = "zlib"
>> +
>> +PE = "1"
>> +
>> +SRC_URI = "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${BPN}-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "d3912b9f7bf745fbfea68f6a9b9de30f"
>> +SRC_URI[sha256sum] = "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368"
>> +
>> +EXTRA_OEMAKE = "\
>> +    'CC=${CC}' \
>> +    'CFLAGS=${CFLAGS}' \
>> +    'LDFLAGS=${LDFLAGS}' \
>> +"
>> +
>> +do_compile_prepend() {
>> +    ln -sf GNUmakefile Makefile
>> +}
>> +
>> +do_install() {
>> +    install -d ${D}${bindir}
>> +    install mkcramfs ${D}${bindir}
>> +    install cramfsck ${D}${bindir}
>> +}
>> +
>> +BBCLASSEXTEND = "native"
>> --
>> 1.8.1.5
>>

