Return-Path: <petter@technux.se>
Received: from vsp-authed-01-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id E5DC060144
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 04:53:26 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-01-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Fri,  9 May 2014 06:53:34 +0200 (CEST)
Received: from webmail.binero.se (unknown [195.74.38.9])
	(Authenticated sender: petter@technux.se)
	by smtp-02-01.atm.binero.net (Postfix) with ESMTPA id 285FD3A123;
	Fri,  9 May 2014 06:53:21 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 09 May 2014 06:53:21 +0200
From: petter@technux.se
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20140508105334.GP30955@jama>
References: <cover.1399497346.git.petter@technux.se>
	<f81a9671ffe21ca44d9a06d78a61550e94ba170c.1399497346.git.petter@technux.se>
	<20140508105334.GP30955@jama>
Message-ID: <7ebd830c6330d909b128a8d25d368689@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/13] python: remove usage of FILESPATH
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
X-List-Received-Date: Fri, 09 May 2014 04:53:31 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

2014-05-08 12:53 skrev Martin Jansa:

> On Wed, May 07, 2014 at 11:19:56PM +0200, Petter Mabäcker wrote:
>
>> Fixes [YOCTO #4497] Usage of FILESPATH is discouraged, since it can
>> make recipes harder to bbappend. Instead FILESEXTRAPATHS should be 
>> used
>> to extend the path. Don't migrate paths that already exist in base
>> FILESPATH to FILESEXTRAPATHS (e.g. BPN, BP and files). 
>> Signed-off-by:
>> Petter Mabäcker <petter@technux.se> ---
>> .../recipes-devtools/python/python-native_2.7.3.bb | 2 +-
>> .../python/python-pygobject_2.28.3.bb | 2 +- 2 files changed, 2
>> insertions(+), 2 deletions(-) diff --git
>> a/meta/recipes-devtools/python/python-native_2.7.3.bb
>> b/meta/recipes-devtools/python/python-native_2.7.3.bb index
>> 0c66d27..4949546 100644 ---
>> a/meta/recipes-devtools/python/python-native_2.7.3.bb +++
>> b/meta/recipes-devtools/python/python-native_2.7.3.bb @@ -21,7 +21,7 
>> @@
>> SRC_URI += " " S = "${WORKDIR}/Python-${PV}" -FILESPATH =
>> "${FILE_DIRNAME}/python-native/:${FILE_DIRNAME}/python/"
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:" inherit native diff
>> --git a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
>> b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb index
>> 9dbe47c..691666c 100644 ---
>> a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb +++
>> b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb @@ -16,7
>> +16,7 @@ SRC_URI[md5sum] = "aa64900b274c4661a5c32e52922977f9"
>> SRC_URI[sha256sum] =
>> "7da88c169a56efccc516cebd9237da3fe518a343095a664607b368fe21df95b6" S 
>> =
>> "${WORKDIR}/pygobject-${PV}" -FILESPATH =
>> "${FILE_DIRNAME}/python-pygobject:${FILE_DIRNAME}/files"
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
> Is this one correct?
>
> There is
> BBCLASSEXTEND = "native"
>
> and prepending python-pygobject-native doesn't seem to be needed.

You're right, this is not needed for pygobject. Will fix this in v2.
>
>> EXTRA_OECONF += "--disable-introspection" PARALLEL_MAKEINST = "" --
>> 1.7.9.5 -- _______________________________________________
>> Openembedded-core mailing list 
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core [1]


Links:
------
[1] http://lists.openembedded.org/mailman/listinfo/openembedded-core

