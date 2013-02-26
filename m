Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UARm3-00026T-Pn
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 22:09:21 +0100
Received: by mail-oa0-f44.google.com with SMTP id h1so6291204oag.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 12:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=56VdiFh3kDprHQangpYQnBfq/C+jM6Q1QoPTUAjxs1s=;
	b=WtN/7cUn14of4Qr6rfVR6MyybMnuEER6BaMSsH4ZzXgthu9joJt6XCz5o8u01kopHI
	1vOCzRWniHyG9gXpC/A6jZbi0u/01+WGKYc6KC/63T3P5dW7sqOGpmj4x34KGpcAa8ez
	pfVo7aXOM5Khz7Z5bNREE2MaD1XAPcdlScyBnlQlg6/JAfNAj32eNBJZAorV7YwmiuFh
	deofa0gpsHL+O5d0qa5MS/sdbhs/+S6XR5u83IoKf3aq3giEYGJ8xQ78vuno+Oo60CF7
	ljmH3+GK6c9rnf4xtbtYilICxDYPKtbpeSb0DnUUpT+rN/oWTfwXuo7K+LvN6b8KBQTR
	dQGA==
MIME-Version: 1.0
X-Received: by 10.182.231.39 with SMTP id td7mr12933646obc.86.1361911979561;
	Tue, 26 Feb 2013 12:52:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Tue, 26 Feb 2013 12:52:58 -0800 (PST)
In-Reply-To: <CAJTo0LbwqK6wxJoB8FwXx_eHuyy71QhUH-cFvcDGDTOCAkjPDQ@mail.gmail.com>
References: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrv9kbMuhMK6OnEGNqNRn0ZHM1R7xZwYAFa=QjivCcigg@mail.gmail.com>
	<CAJTo0LYFL_-YuemRozDYKaGaa1+mKtv8YgHUJdGnnHqPRKzDQA@mail.gmail.com>
	<CAP9ODKrSYh2vxAotVRFmvy+JbP_yexyRqb6hftsR=FOde4AjZQ@mail.gmail.com>
	<CAJTo0Las-tCaN47Dz8Jn_W-YP6O__0Wqts3EBZDLbqAkv4F7FQ@mail.gmail.com>
	<1361907835.5119.57.camel@ted>
	<CAJTo0LbwqK6wxJoB8FwXx_eHuyy71QhUH-cFvcDGDTOCAkjPDQ@mail.gmail.com>
Date: Tue, 26 Feb 2013 17:52:58 -0300
X-Google-Sender-Auth: jp_IFopo8-UHQ3z4m7CHA6l0ZHs
Message-ID: <CAP9ODKr0MgSyi7_nAdenhuyyGkfRw-hTPy3mWoHLjaRCD4DHcw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
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
X-List-Received-Date: Tue, 26 Feb 2013 21:09:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 5:44 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 26 February 2013 19:43, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> Check exactly what is in configure.ac. You should be able to use allarch
>> and if you can't, it means the configure script is referencing the
>> compiler, even if it shouldn't be using it. Its designed such that these
>> accesses fail verbosely. It should be a simple fix if the recipe really
>> is just configuration.
>
> | configure:2707: checking host system type
> | configure:2716: error: /bin/bash ./config.sub allarch-poky-linux failed
>
> The configure.ac ends up running AC_CANONICAL_HOST because it uses
> different manpage sections for Solaris and everything else.
>
> I think they should be using AC_CANONICAL_SYSTEM, but that calls
> AC_CANONICAL_HOST anyway so that wouldn't achieve anything.
>
> So, extend my patch, or intrusively patch out the documentation build
> code in xkeyboard-config.

I'd say to drop the AC_CANONICAL_HOST call and make it fake Linux as a
fixed value.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


