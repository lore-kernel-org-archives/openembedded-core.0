Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id AABEA6DC8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:36:05 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id m1so2011049oag.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=6SXRAam4scB+AxO1mE2+U7/9KjugEQmvnf7hT2svLZ8=;
	b=DTG5OMjyZwwwq6EKoDSeKm77PgOjKNxerSUrzJHraAueFB173QdAIMEIdczraGC2Lv
	FugWKn4EdcDmJAL7lxw2HjUkCqeZq0hceNvsTnYlAKv9nlcRqUzD1m476WWZGa++Z/Xm
	fLadei8htO0xw7B8WlcsAPHRAV9mHqdXGG6BBbJumgfiH2PX1jlMeNf6KNp6Kd8Rp8yE
	wW6J1vtWzjLxqTi/Aw5Nnb0F+NtQIq+vBrdPaTHW3hjknxKW5Bp6cbhYXk9A/DLJPQ5X
	QE9CtgNDChSPIfotXTdjBxqyrkAtcNzJLVx0L6VwJcrQZGW1GlGuH8SmUTQ9huFyuX8r
	Z5xg==
MIME-Version: 1.0
X-Received: by 10.60.79.168 with SMTP id k8mr5499582oex.7.1390480566710; Thu,
	23 Jan 2014 04:36:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 04:36:06 -0800 (PST)
In-Reply-To: <1390479686.17424.100.camel@ted>
References: <1390459814-15764-1-git-send-email-sgw@linux.intel.com>
	<1390460640.24755.11.camel@e130.pbcl.net>
	<1390479686.17424.100.camel@ted>
Date: Thu, 23 Jan 2014 10:36:06 -0200
X-Google-Sender-Auth: afdcSWnFnwPs1LGIB_SeanQF9-Q
Message-ID: <CAP9ODKo4bmxc1hp3kH+wxoaKw8J-3+XpD9_YYLQ8NgafZ2p92A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boot-directdisk: fix the support of vmdk
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
X-List-Received-Date: Thu, 23 Jan 2014 12:36:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 10:21 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2014-01-23 at 07:04 +0000, Phil Blundell wrote:
>> On Wed, 2014-01-22 at 22:50 -0800, Saul Wold wrote:
>> > +IS_VMDK = '${@base_contains("IMAGE_FSTYPES", "vmdk", "true", "false", d)}'
>> > +
>> > +   if [ "${IS_VMDK}" ]; then
>>
>> Does that really work?  I can't quite see how it would, but I might be
>> overlooking something.  Presumably you did test this, right?
>
> I've merged this since I really would like to try and get the builds
> stabilised. I did fix the patch since it would always evaluate as true
> the way it was...

What is the point in having:

+       if [ "${IS_VMDK}" = "true" ]; then

This is an indirection that buys nothing.

-       if [ ${IMAGE_FSTYPE} != "vmdk" ]; then
-               dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
-               dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
-       fi
+       dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
+       dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512

This changes the logic but commit log is not clear /what/ it fixes. I
did valid comments in the patch and you didn't considered those.

I just wasted time reviewing it...



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

