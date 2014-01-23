Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4CDF96E38B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 18:59:38 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id e14so1670572iej.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 10:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7+xu4R04pQlQ0wS1aKqwVNzLlujqRwrB3FfG2SjT7L4=;
	b=XoaBzGwz6YU4xPHGKVS4wmPbqrSlMvm5slAqYNmEL7FmfBMicCv9CHJo04nvgEwXlM
	CDsA0Ynfe84GggWs2E2BDR+s/e7sDrCDyLh3MBP/b5YGKdbXiiaplwcnjBjuslqCHxLg
	eXUCGlZDwJ33k/+a2Znl42vyQAPA4hnh5ejr1rJc9+i4q/zdE/YsS+zLGM64H2K159na
	LN7GXtFuQyRg7vS75C5G+w8dHsdFPFdQsZVMAA4B/7hFyZFdl+SE4FipEyaIvk7mT0f7
	1WSRpkPvoLykbxMGBDUsJVMD6XQHb4YeO/Gr3xAxv//tfhJXiwndyZMa/ydbL4OtjADR
	QwVw==
X-Received: by 10.50.136.165 with SMTP id qb5mr827371igb.2.1390503579157; Thu,
	23 Jan 2014 10:59:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Thu, 23 Jan 2014 10:59:09 -0800 (PST)
In-Reply-To: <2192967.LGKIi1tr8F@peggleto-mobl5.ger.corp.intel.com>
References: <1386375114-7702-1-git-send-email-raj.khem@gmail.com>
	<5069586.lVvcYzeSdC@helios>
	<2192967.LGKIi1tr8F@peggleto-mobl5.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jan 2014 10:59:09 -0800
Message-ID: <CAMKF1sp+01ugOupFT9JMVDJ3LHsOgRMSco3zC+dpRUMrKR3Egw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: Specify lang in decoding strings
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
X-List-Received-Date: Thu, 23 Jan 2014 18:59:38 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 23, 2014 at 10:26 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Saturday 28 December 2013 22:52:18 Paul Eggleton wrote:
>> On Friday 06 December 2013 16:11:54 Khem Raj wrote:
>> > On systems where default locale is utf-8 we get errors like
>> >
>> > File: 'buildhistory.bbclass', lineno: 38, function: write_pkghistory
>> > 0034: if pkginfo.rconflicts:
>> > 0035: f.write("RCONFLICTS = %s\n" % pkginfo.rconflicts)
>> > 0036: f.write("PKGSIZE = %d\n" % pkginfo.size)
>> > 0037: f.write("FILES = %s\n" % pkginfo.files)
>> > *** 0038: f.write("FILELIST = %s\n" % pkginfo.filelist)
>> > 0039:
>> > 0040: for filevar in pkginfo.filevars:
>> > 0041: filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
>> > 0042: val = pkginfo.filevars[filevar]
>> > Exception: UnicodeEncodeError: 'ascii' codec can't encode character
>> > u'\xed' in position 337: ordinal not in range(128)
>> >
>> > This patch specifies decode to use utf-8 so ascii and utf-8 based
>> > locales both work
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >
>> >  meta/classes/buildhistory.bbclass |    2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/buildhistory.bbclass
>> > b/meta/classes/buildhistory.bbclass index 1e6d968..4ff39a0 100644
>> > --- a/meta/classes/buildhistory.bbclass
>> > +++ b/meta/classes/buildhistory.bbclass
>> > @@ -190,7 +190,7 @@ python buildhistory_emit_pkghistory() {
>> >
>> >                  key = item[0]
>> >
>> >                  if key.endswith('_' + pkg):
>> >                      key = key[:-len(pkg)-1]
>> >
>> > -                pkgdata[key] = item[1].decode('string_escape')
>> > +                pkgdata[key] = item[1].decode('utf-8', 'string_escape')
>> >
>> >          pkge = pkgdata.get('PKGE', '0')
>> >          pkgv = pkgdata['PKGV']
>>
>> Khem, did you test that this actually works? Here it does not - I get
>> strings with \n \t in them; reverting this change makes it interpret these
>> as it should.
>
> Unless I'm misunderstanding, I think the second parameter here is wrong, since
> according to the Python docs it's supposed to specify what to do when an error
> occurs, not specify another encoding to decode. Should it be
> .decode('utf-8').decode('string_escape') instead?
>

Yes that seems more likely the right thing to do.


> The problem that I have is I can't reproduce the failure that you observed, so
> I need you to help me to fix this properly.

I see the failure on a newly installed debian wheezy with no locale's installed.


>
> Thanks,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

