Received: from mail-pd0-f169.google.com ([209.85.192.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <b08248@gmail.com>) id 1UXteI-0006pE-KR
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 15:34:16 +0200
Received: by mail-pd0-f169.google.com with SMTP id 14so354957pdc.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 06:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=JtRjqrC52U0LF7ayms/dT959nVCuMhDiT5yof5L8Q6c=;
	b=muBuhchV7B4Hcnj4C6nbZd29R3EZ9c6v+qRjvV/zQfaqoqILwix+cd4kwt/FTJq1A0
	PfQAGL1FXtZPvv7E93yZ8DZA1+0PCDjs/pToaCPoGn6TJ5dQNi9sD0xYXCR6Jk/vwsFG
	3MgjVpnyJ/OpOwKgjCw6fsYURG9txWTEa6Ez/svgYGoz8SvqzE5Qq8QTYAZZZPOzC+s9
	5+WAqYQOfW18vaNYjjb3wEIOJe4xqIFCioeDZ1EkrHElbHfwVJ5pq56fgkRL3qULvk8n
	2S0tu+m2ebuDsfNUBstGy2oDlWmwGeJYjCCz7Sj2aVf3HLJSZuScsNecDn/YYCpTlMT5
	Kc0g==
MIME-Version: 1.0
X-Received: by 10.66.26.71 with SMTP id j7mr9540884pag.209.1367500580434; Thu,
	02 May 2013 06:16:20 -0700 (PDT)
Received: by 10.67.5.194 with HTTP; Thu, 2 May 2013 06:16:20 -0700 (PDT)
In-Reply-To: <2887547.jBA5alvWfN@helios>
References: <CALRxmdD5r1MGDuDjBKHYcB9eLQ1FL9BZM5_QQxLNpQOcyOHvVA@mail.gmail.com>
	<CAJTo0LYk3yyh3dXk5hmvbvpiv9fWNmgoZpYzUb_U9Kc6CsMELA@mail.gmail.com>
	<2887547.jBA5alvWfN@helios>
Date: Thu, 2 May 2013 08:16:20 -0500
Message-ID: <CALRxmdCsEHp6yDPsrTXyFjsiQ=65Jo=GLc1sqRUL0Gv4FiSZ_w@mail.gmail.com>
From: Stuart Yoder <b08248@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: yajl: Installed (but unpackaged) file(s) found
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
X-List-Received-Date: Thu, 02 May 2013 13:34:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

yajl/libyajl is a dependeny I have for another package I'm trying to
build so I'm not touching the yajl recipe at all.  In fact the
complete recipe is this:

---------------------------------
DESCRIPTION = "Yet Another JSON Library - A Portable JSON parsing and serializat
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://COPYING;md5=74f541bd9a2b6c8e5d0714bcdc327f32"

SRCREV = "fee1ebef9fa7dc0e9f5a23f37123b19b68c796ff"
SRC_URI = "git://github.com/lloyd/yajl.git"

S = "${WORKDIR}/git"

inherit cmake lib_package
---------------------------------

It's just my observation that there seems to be a discrepancy between
what is getting built and packaged.   Things get built in ./lib and
packaged from ./lib64.

Do I really need to explicitly define FILES_yajl in this recipe?   It
seems like yajl is not the only package that might have this kind of
issue.   I have this feeling that there might be some simpler fix, but
I'm a novice at Yocto.

Stuart

On Thu, May 2, 2013 at 4:36 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 02 May 2013 10:24:10 Burton, Ross wrote:
>> On 1 May 2013 20:11, Stuart Yoder <b08248@gmail.com> wrote:
>> >    FILES_yajl="/usr/bin/* /usr/sbin/* /usr/lib64/yajl/* ...
>> >
>> > Ho do I get the yajl recipe to either a) build the files in lib64 or
>> > b) package them from lib.
>>
>> Don't hard-code paths, instead use the symbols available in bitbake.conf:
>>
>> FILES_yajl = "${bindir}/* ${sbindir}/* ${libdir}/yajl/*"
>
> You should also use FILES_${PN} rather than FILES_yajl.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


