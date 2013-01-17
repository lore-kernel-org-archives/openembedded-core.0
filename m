Received: from eu1sys200aog104.obsmtp.com ([207.126.144.117])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1Tvuyg-0007gF-HE
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 20:18:19 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob104.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUPhK4GDfyzCAZTGS/fnojKqIf7TwpDXl@postini.com;
	Thu, 17 Jan 2013 19:02:57 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 627701CA;
	Thu, 17 Jan 2013 16:59:02 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25D204F27;
	Thu, 17 Jan 2013 16:59:02 +0000 (GMT)
Received: from CTN005027 (pcmdt30.ctn.st.com [164.130.129.192])
	by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id AVN58794 (AUTH condorg);
	Thu, 17 Jan 2013 17:59:01 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: "'Martin Jansa'" <martin.jansa@gmail.com>
References: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
	<20130116150205.GE3002@jama>
	<CAOHjBZsXebja8FB4GbQNwm5zxBCoEOPh40rE9b71EzXG5fGWdA@mail.gmail.com>
	<20130117124209.GE3067@jama>
	<065b01cdf4b6$e1510160$a3f30420$@st.com>
	<20130117134619.GI3067@jama>
In-Reply-To: <20130117134619.GI3067@jama>
Date: Thu, 17 Jan 2013 17:59:00 +0100
Message-ID: <068101cdf4d3$f2e58fa0$d8b0aee0$@st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQJd3UIgpWykE/uuKxds/KWg86Wy7AI8MptVAf37k6YCXM8t6gG5dPdSAgbRfn+W2zFUIA==
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix as and ld check in libc dir
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
X-List-Received-Date: Thu, 17 Jan 2013 19:18:19 -0000
X-Groupsio-MsgNum: 33987
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0682_01CDF4DC.54AE8B80"
Content-Language: it

------=_NextPart_000_0682_01CDF4DC.54AE8B80
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: Martin Jansa [mailto:martin.jansa@gmail.com]
>Sent: gioved=EC 17 gennaio 2013 14:46
>To: Giuseppe CONDORELLI
>Cc: 'Giuseppe Condorelli'; openembedded-core@lists.openembedded.org
>Subject: Re: [OE-core] [PATCH] eglibc: fix as and ld check in libc dir
>
>On Thu, Jan 17, 2013 at 02:30:55PM +0100, Giuseppe CONDORELLI wrote:
>> Hi Martin,
>>
>> Do you mean applying the patch you highlighted in libc/configure?
>
>I was expecting you're trying to fix ld --version detection when ld is
gold. But
>after few experiments I don't see what you're trying to fix:
>
>martin@jama ~ $ ld.bfd --version 2>&1 | sed -n 's/^.*GNU ld.* =
\([0-9][0-
>9]*\.[0-9.]*\).*$/\1/p'
>2.23.1
>martin@jama ~ $ ld.gold --version 2>&1 | sed -n 's/^.*GNU ld.* =
\([0-9][0-
>9]*\.[0-9.]*\).*$/\1/p'
>nothing -> ld.gold still unsupported
>
>old:
>martin@jama ~ $ echo 2.23.1 | egrep
"2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-
>9][0-9]*"
>2.23.1
>martin@jama ~ $ echo 2.19.1 | egrep
"2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-
>9][0-9]*"
>2.19.1
>martin@jama ~ $ echo 2.19   | egrep
"2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-
>9][0-9]*"
>2.19
>martin@jama ~ $ echo 2.1    | egrep
"2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-
>9][0-9]*"
>2.1
>
>new:
>martin@jama ~ $ echo 2.19.1 | egrep
"2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-
>9]*"
>2.19.1
>martin@jama ~ $ echo 2.23.1 | egrep
"2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-
>9]*"
>2.23.1
>martin@jama ~ $ echo 2.19   | egrep
"2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-
>9]*"
>2.19
>martin@jama ~ $ echo 2.1    | egrep
"2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-
>9]*"
>2.1
>
>Can you show some example version your patch is fixing?
>

Hi Martin,

Please untar the attachment and run the test I sent you.
It reproduces the same scenario as in the libc/configure eglibc file.

Cheers,
Giuseppe

>Cheers,
>
>> >-----Original Message-----
>> >From: Martin Jansa [mailto:martin.jansa@gmail.com]
>> >Sent: gioved=EC 17 gennaio 2013 13:42
>> >To: Giuseppe Condorelli
>> >Cc: Giuseppe CONDORELLI; openembedded-
>core@lists.openembedded.org
>> >Subject: Re: [OE-core] [PATCH] eglibc: fix as and ld check in libc
>> >dir
>> >
>> >On Wed, Jan 16, 2013 at 04:07:39PM +0100, Giuseppe Condorelli wrote:
>> >> 2013/1/16 Martin Jansa <martin.jansa@gmail.com>
>> >>
>> >> > On Wed, Jan 16, 2013 at 03:14:07PM +0100, Giuseppe CONDORELLI
>wrote:
>> >> > > Fix routine to check as and ld version check in the configure,
>> >> > > to
>> allow
>> >> > system
>> >> > > to correctly check for version 2.1x.
>> >> >
>> >> > Does it build with gold now?
>> >> >
>> >> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-
>> >March/020310.html
>> >
>> >does it?
>> >
>> >--
>> >Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>
>--
>Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

------=_NextPart_000_0682_01CDF4DC.54AE8B80
Content-Type: application/x-compressed;
	name="test_for_Martin.tgz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="test_for_Martin.tgz"

H4sIACIs+FAAA+3S32qDMBQGcK99ijM3KC0sTWKtSBk+wZ5AhqTqqoyZotmfiz38TJGOtRTdoB2M
73fh0ZBDPo+aojXpo27Se9WYqnbOgXfCILBVct+3VYSB2K3be+EvHCF5uORyseTc4cK3S8TPkubA
S2tUQ+Rkus51szm57zk3l4hzaddX83VVz9vSdVWWbhu9SV+Lpq10fedJJiIWCCY5j7ovF3ium6m2
oJuDnVTVLhFNJlMqslKTV2vaKpOVjLHjzXEc01rl3mplm7ozEn4bPewusw/JEvn1lPhdYV0V+7Wp
beqMOEg/9WfMRuXqMxWtyk6/J/3S9/m8Vab88YTGDGcown5wAwmORzfQ0Mftp1e8V4a4+9f/NgAA
AAAAAAAAAAAAAAAAAADAf/cJd73P8QAoAAA=

------=_NextPart_000_0682_01CDF4DC.54AE8B80--
