Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 63AF772849
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 12:48:11 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id id10so8014558vcb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 04:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=VrCNnLCUeiiNb6BXRHmRAED4d0OLsI01tIArknZt5A4=;
	b=laNiIcT0phpp9OcGxpbQaZz2INrqLBEXLrjxwj6DBKKbbzOx2A80FSfYMIP6UrPpt4
	6UenDijhnTB/Pl7EmPfZa4RmsaNsPOiEoYL4SojlRZOnmFdAIYPsO3JILbe250NWygQE
	fqh4m//E1v7CTelZfyLOmL+eNJ0C6HLTqTSQ8c9ufy2+QhAfOw7e2587z/slS8e0wW4m
	fpBn+wdMr8Y3AYQN3pYME6ry9v0uXzRMD2ZqPy36ebblQwGX2Yn+u01nJmKPU0/QgXQZ
	W5K1Cdy8PzVatMJ2z7Ee/gEYtKZNKHryZaLqlEEFk566I3FIt3ma5rciXgb3F2mC6zJa
	vJ8g==
X-Gm-Message-State: ALoCoQlPkotajrse0Ij4l2O5SY4anaVNFV6eU/iFzJNneOOR3LDNYj446JQhaife+4AySw4FrF1S
MIME-Version: 1.0
X-Received: by 10.52.35.38 with SMTP id e6mr11776727vdj.17.1420462092251; Mon,
	05 Jan 2015 04:48:12 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.53.1.75 with HTTP; Mon, 5 Jan 2015 04:48:12 -0800 (PST)
In-Reply-To: <CAOMwXhP9GfyYB+_4qjZbcGO86dwWKW3hP3py1k1_Kon0wBiX-w@mail.gmail.com>
References: <CAOMwXhPbXCQ7ui+J0a8ryekeq5Yy5EXdgt-Qr26Z9w74=vyD5w@mail.gmail.com>
	<1415101721.23396.20.camel@ted>
	<CAOMwXhP9GfyYB+_4qjZbcGO86dwWKW3hP3py1k1_Kon0wBiX-w@mail.gmail.com>
Date: Mon, 5 Jan 2015 12:48:12 +0000
X-Google-Sender-Auth: m_WI0xwkgWbwcWK-1JECWmHQ0is
Message-ID: <CAOMwXhMeTkn-YoHv2b8qvYfFpbVq6iURrxJWF7DGQZLNeHhYzg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Specifying 32 bit dependency for 64 bit software
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
X-List-Received-Date: Mon, 05 Jan 2015 12:48:16 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 20, 2014 at 6:17 PM, Laszlo Papp <lpapp@kde.org> wrote:
> On Tue, Nov 4, 2014 at 11:48 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2014-11-03 at 17:29 +0000, Laszlo Papp wrote:
>>> we have a tool that we run during our make run, but this tool is
>>> hard-coded for 32 bit. It depends on software like ncurses. I could
>>> add ncurses-native in an ideal world; no problem.
>>>
>>> The problem is that my host environment is 64 bit currently and it is
>>> not possible to migrate the whole environment to 32 bit. I am happy to
>>> explain the details if needed, but I would love you to trust me about
>>> that. =)
>>>
>>> So, is it possible to say more than just DEPENDS = ncurses-native,
>>> something like DEPENDS = ncurses-native:x86 or something?
>>
>> How much of a 32 bit system do you have? Do you at least have a 32 bit
>> capable compiler and C libraries?
>>
>> If so, you could use our general class extension mechanism
>> (BBCLASSEXTEND) to allow 32 bit variants of the native recipes, e.g. a
>> "native32" form.
>>
>> Alternatively, a more easier approach would be to build a target like
>> buildtools-tarball with SDKMACHINE="i686" and then install that onto the
>> system you're building on.
>
> I am just back from my long vacation. I am sorry about not replying
> earlier. OK, thank you so much; I will give the buildtools-tarball a
> go.

In the end, it was simpler to use this on my Wheezy (Debian)

dpkg --add-architecture i386 && apt-get update && apt-get install
install mylib:i386

>
> Cheers, L.
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>>

