Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkVav-0008Ck-A4
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 09:26:21 +0200
Received: by eekd49 with SMTP id d49so1208231eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 00:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=1CQB3t26oqvE3KHKHttoFN6k1bv5SWUOLY28MOVgK70=;
	b=qHS17JAZEimCJrjstQKdrlwz4kARKY7T/HqVhXWZ6wZP43/Elct1sXaRzyXfTsI3Tq
	ZmJ8Ynq4P+thhNAgO1Y3zSLAIFIFGshx7PvMZIYQkLTNCbX6htFnpiwpfmLPSahxxXRi
	c1IgzuO/Q5yQnK0OLMtl/voX17X9IrIf+O8MFCcswrNUrJD0A9NqtOukjcSBXrfiZ+E6
	ozv3Z3EIw5aX65sPB34JiNGoLHRXhs8MdnwOanTE4KrmW3km7wbOyk2TS3Su5IaDOYQU
	iEq90rON8bT9/IhhkVwv6RvniwYYrK6wZnv+cI36mioUXrnrCxidCdRuak3ICkcXec5w
	QzAw==
Received: by 10.14.37.206 with SMTP id y54mr265539eea.218.1340954125752; Fri,
	29 Jun 2012 00:15:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 00:14:55 -0700 (PDT)
In-Reply-To: <4FED4B77.2090107@windriver.com>
References: <cover.1340773014.git.liezhi.yang@windriver.com>
	<63976f811fe5cb0c5688fe6847975499ac2d9e51.1340773014.git.liezhi.yang@windriver.com>
	<4FED0AD9.5010102@windriver.com>
	<CAMKF1spBJ-iVuHC_BxscqAw355gUMCYnh_g6zwT4oOwz91hxyA@mail.gmail.com>
	<4FED3CA3.60605@windriver.com>
	<CAMKF1sp_BL7R9PZgTnZXh4y9Rp0MdFUpeyGqfbV5He4XJqkLwQ@mail.gmail.com>
	<4FED4B77.2090107@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jun 2012 00:14:55 -0700
Message-ID: <CAMKF1soCQ=4yXT8ujs-9YVLUGd8G-fMiL-TeBSJL_VerG-L4Zw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] icu 3.6: do_install failed: Segmentation fault
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
X-List-Received-Date: Fri, 29 Jun 2012 07:26:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 11:30 PM, Robert Yang <liezhi.yang@windriver.com> w=
rote:
>
>
> On 06/29/2012 02:06 PM, Khem Raj wrote:
>>
>> On Thu, Jun 28, 2012 at 10:26 PM, Robert Yang<liezhi.yang@windriver.com>
>> =C2=A0wrote:
>>>
>>> We should still use a constant size since the length of the command
>>> is unknown (or not obviously known):
>>
>>
>> thats the point. Cant you use srtlen(cmd) ?
>>
>
> I'm afraid not, as the code shows below, we should strlen()
> each component of the cmd:
>
>
> =C2=A0 =C2=A0sprintf(cmd, "%s %s%s -f %s %s %s %s %s",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0o->install ? "INSTALLTO=3D" : "",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0o->install ? o->install =C2=A0 =C2=A0: "",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0o->makeFile,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0o->clean =C2=A0 ? "clean" =C2=A0 =C2=A0 =C2=A0=
: "",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0o->rebuild ? "rebuild" =C2=A0 =C2=A0: "",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0o->install ? "install" =C2=A0 =C2=A0: "",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0o->makeArgs);
>
> and this is only the part for linux os, it still has similar parts for
> U_WINDOWS and OS400 (the component are different), if we strlen() each
> one of them, that would make it complicated. the icu pkg does use many
> malloc() in the other part of code, but it uses the char array here,
> I think that maybe this is the reason.
>

OK its fine what you have

> // Robert
>
>>
>


