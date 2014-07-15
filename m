Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC7B7058D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:33:43 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id wn1so5782339obc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=WwcreOSVWF0rO8qP7QOBYL68tcIomk/JO6O0BnRxs9c=;
	b=Yf+s/zbQ0PRA2hJWZXXVjfn6q1CFOWr+USNgN3QNKvSAxfdOfBS+jEry6jtLgeDu5M
	c2Id90597WQdacrhDfNTrqH5+ALLimNvO6xs/cx3TcDntRjbh3dIW6qGCIPX6Y0tqGyK
	Y5zeMdvdCo7mYbiTnbVGVAf9Rs9K5ochVmAYZBrWqvP4KgVfaUvR1/x1wz6w/114kWOT
	li80se1vF54FCYNgMsajkDKO2SSQEBm0ZvpLPnhrvXK3LYJodOhQbZbaI3si7qGGYHcI
	VhO0Ug9CJTLmxM7ef2/Bkll/2eNN0PslMimkBXEoUc8thxGol6w6v9Lhe02n56TYLMdg
	6MlA==
MIME-Version: 1.0
X-Received: by 10.182.28.66 with SMTP id z2mr25733811obg.19.1405431224257;
	Tue, 15 Jul 2014 06:33:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Tue, 15 Jul 2014 06:33:44 -0700 (PDT)
In-Reply-To: <1405378518-4832-3-git-send-email-joaohf@gmail.com>
References: <1404266329-13524-1-git-send-email-joaohf@gmail.com>
	<1405378518-4832-1-git-send-email-joaohf@gmail.com>
	<1405378518-4832-3-git-send-email-joaohf@gmail.com>
Date: Tue, 15 Jul 2014 10:33:44 -0300
X-Google-Sender-Auth: zAm27CJD94_eOoaYwBFKPcFplHw
Message-ID: <CAP9ODKr1fxmPVE3ejC0T8JCYpyOPk9dWjoPCZw4Mwv8s-QS+Xw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?Q?Jo=C3=A3o_Henrique_Ferreira_de_Freitas?= <joaohf@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] populate_sdk_base: ensure that filenames with empty space character are handled
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
X-List-Received-Date: Tue, 15 Jul 2014 13:33:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2014 at 7:55 PM, Jo=C3=A3o Henrique Ferreira de Freitas
<joaohf@gmail.com> wrote:
> When extracting toolchain, if the list $executable_files has filenames
> with empty space character, the list will created but relocate_sdk.sh
> will not handle it well. This will lead to the below erro:
>
>     ./tmp/deploy/sdk/buildtools-mytools-x86_64-nativesdk-standalone-1.6.1=
.0.sh
>     Enter target directory for SDK (default: /opt/mydistro/mytoolset/1.6.=
1.0):
>     You are about to install the SDK to "/opt/mydistro/mytoolset/1.6.1.0"=
. Proceed[Y/n]?
>     Extracting SDK...done
>     Setting it up.../opt/mydistro/mytoolset/1.6.1.0/relocate_sdk.sh: line=
 2: sintaxe error `token'  `('
>     /opt/mydistro/mytoolset/1.6.1.0/relocate_sdk.sh: line 2: `e
>
> The same occurs with replacement of ${SDKPATH} in configs/scripts/etc fil=
es.
>
> We should ensure that full path is protected before relocate_sdk.sh
> and ${SDKPATH} replacement calls.
>
> Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>

I am wondering if we cannot get rid of the 'tr' command that converts
newlines to '\0'. This would avoid a new fork of command. Did you
think about it?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

