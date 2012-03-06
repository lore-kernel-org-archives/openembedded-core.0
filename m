Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1S534l-0002C2-1m
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 23:41:47 +0100
Received: by obqv19 with SMTP id v19so6944501obq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 14:33:09 -0800 (PST)
Received-SPF: pass (google.com: domain of slapinid@gmail.com designates
	10.182.53.66 as permitted sender) client-ip=10.182.53.66; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of slapinid@gmail.com
	designates 10.182.53.66 as permitted sender)
	smtp.mail=slapinid@gmail.com;
	dkim=pass header.i=slapinid@gmail.com
Received: from mr.google.com ([10.182.53.66])
	by 10.182.53.66 with SMTP id z2mr11231598obo.3.1331073189897 (num_hops
	= 1); Tue, 06 Mar 2012 14:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=N1NDkzYHiR3D01VzOyx0J9eMOicXU2FlNqdDa15R72Q=;
	b=Mj4QhditHQHckAbRQGFfsUtO/wfYCdcc0J5v9SuCe5y37cxm3zYDAHAIeux+2DyHgQ
	SZkbXc0+6NnqG9uVkGL3Yiils5CsmpIZUwWJuz2KgTfxePP+SaJ5txlUUJJ4ejHflX9i
	4ANGlXc9ETkq66SxFoMXKLGXh9eFR2TEIitPVVrvb50gr31mfwcHs3OaNHnlJ3+5Sir0
	jxAKI1orFGrxFBVS4bLQIIYNcYwxrEewp36RSYeldDONYiB0azoEWoAPu7tFBHKVH34b
	jmtlXf8fNV4KNquvAmNEU1PSBm14XMGoN1vGUzzru091JxnmOtxg6XYrE/yF7i0rBmNq
	TKzg==
MIME-Version: 1.0
Received: by 10.182.53.66 with SMTP id z2mr9640081obo.3.1331073189849; Tue, 06
	Mar 2012 14:33:09 -0800 (PST)
Received: by 10.60.23.6 with HTTP; Tue, 6 Mar 2012 14:33:09 -0800 (PST)
In-Reply-To: <4F566375.30705@intel.com>
References: <CAFZPMoaRKkELBmd1u5SnWF5UDQiHawi9aRJFw72UqGrKLJQNHw@mail.gmail.com>
	<CAFZPMob-UQNR9Q-_EsumFpWj=49t9TNjFYF8WTNLgfDWQ+qiAQ@mail.gmail.com>
	<4F566375.30705@intel.com>
Date: Wed, 7 Mar 2012 01:33:09 +0300
Message-ID: <CAFZPMob0HRhYLbZLt7zvLQkJxF_mRxuF0w5MATNcOHwhLko0bA@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: broken ncurses support for python
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2012 22:41:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 11:20 PM, Scott Garman <scott.a.garman@intel.com> wr=
ote:
> On 03/06/2012 05:06 AM, Sergey Lapin wrote:
>>
>> On Tue, Mar 6, 2012 at 3:08 PM, Sergey Lapin<slapinid@gmail.com> =A0wrot=
e:
>>>
>>> commit dd05e06b89906002f68d616a6326c962e725bc54
>>> Author: Christopher Larson<chris_larson@mentor.com>
>>> Date: =A0 Tue Jan 10 13:51:18 2012 -0600
>>>
>>> =A0 =A0ncurses-native: install to libdir, not base_libdir
>>
>>
>> I was wrong with this one, actual culprit is this one:
>>
>> commit 796c3d038fb7892a5e5206fb10217623de18853f
>> Author: Scott Garman<scott.a.garman@intel.com>
>> Date: =A0 Wed Jan 4 22:30:29 2012 -0800
>>
>>
>>>
>>> breaks python ncurses support.
>>>
>>> Any ideas on proper fixing? For myself I revert this locally and
>>> everything works perfectly.
>>> (I think .so files and .a archives should be in usr/lib while .so
>>> can go to /lib which is not the case with current ncurses.)
>>> so mv in do_install should be sufficient, not --libdir=3D${base_libdir}=
.
>
>
> Could you be more specific about how python ncurses support is broken? I
> assume you're getting errors of unresolved symbols. If that's the case, y=
ou
> may need to rebuild the application so it links to ncurses from base_libd=
ir.
No, python fails to find the library.
And it is bad practice to put develeopment files in /lib anyway.
I think, putting .so.x.x intu lib was sufficient instead of setting
whole libdir to /lib.
Or development files might be moved to /usr/lib back (and .so symlink re-cr=
eated
to address this).


