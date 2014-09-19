Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1769F71476
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 04:42:36 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id ar1so2613903iec.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 21:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/JKQKTa2OwlWeBpPEQJ/Z8dIF8OEnNNMyGtFsrpawSM=;
	b=CWRJ+YlYwh8XGKTRigtdbIQnLI/M9TFqwM4/9254kLqnkhAylbBqy1cgXWeY0k8+PJ
	Ej8ESdYwKsEApAnYsKrVUC2HeDNoxjRKg9iobcw0jC67fvNwDoDOCPzdA2VvZopMnnvi
	ba2lwjLhWJbdOXNqQMjHsBZlhdzbfHMwTv+dS6hU/yL9g6oMAj8gJT81eI8fS/wSrQbr
	fjQeFeJfFz88hzPfwx3X8tp2RwxXelUmZtesA6UYxBsW8NU/gY/ELjU0Sen1w+J8QQhA
	wA2c8qr33GfbWb5ML8NbqmgJ+6x8xRnOmB/g3pjdOeHAc5D3SivBkUejtrNNdxvra4qO
	4KzA==
X-Received: by 10.42.39.142 with SMTP id h14mr17848449ice.32.1411101756599;
	Thu, 18 Sep 2014 21:42:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.240.6 with HTTP; Thu, 18 Sep 2014 21:42:05 -0700 (PDT)
In-Reply-To: <CABcZANkTvHcwwrswK324f=tFYgqcptGXWQkC-6sopSD3HAXVmQ@mail.gmail.com>
References: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
	<1410916622-26204-7-git-send-email-kergoth@gmail.com>
	<541A890A.8070709@gmail.com>
	<CABcZANkTvHcwwrswK324f=tFYgqcptGXWQkC-6sopSD3HAXVmQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Sep 2014 21:42:05 -0700
Message-ID: <CAMKF1sptrwghp4K84adUwEq7_4zMAmK31JRRsOnCRfrNmNqu8w@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 6/8] blktrace: obey LDFLAGS for btrecord
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
X-List-Received-Date: Fri, 19 Sep 2014 04:42:38 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 18, 2014 at 1:51 PM, Christopher Larson <clarson@kergoth.com> wrote:
>
> On Thu, Sep 18, 2014 at 12:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On 9/16/14 6:17 PM, Christopher Larson wrote:
>> > From: Christopher Larson <chris_larson@mentor.com>
>> >
>> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> > ---
>> >  meta/recipes-kernel/blktrace/blktrace/ldflags.patch | 8 ++++++--
>> >  1 file changed, 6 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
>> > b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
>> > index b9c7c20..037d161 100644
>> > --- a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
>> > +++ b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
>> > @@ -59,8 +59,12 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
>> >   INCS        = -I. -I.. -I../btt
>> >   OCFLAGS     = -UCOUNT_IOS -UDEBUG -DNDEBUG
>> >   XCFLAGS     = -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
>> > -@@ -35,7 +36,7 @@ btrecord: btrecord.o
>> > -     $(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
>> > +@@ -32,10 +33,10 @@ clean: docsclean
>> > +     $(CC) $(CFLAGS) -c -o $*.o $<
>> > +
>> > + btrecord: btrecord.o
>> > +-    $(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
>> > ++    $(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
>> >
>>
>> aren't you passing LDFLAGS to compile step as well here ?
>
>
> I don't think so. This rule creates btrecord from btrecord.o, it doesn't
> compile btrecord.c to btrecord.o, that's an entirely different rule.

thats right. I confused it with filter

