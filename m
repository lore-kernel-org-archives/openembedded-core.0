Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RzyIe-0003Ki-Nz
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 23:35:08 +0100
Received: by bkwq11 with SMTP id q11so6086945bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:26:49 -0800 (PST)
Received-SPF: pass (google.com: domain of steve@sakoman.com designates
	10.204.155.69 as permitted sender) client-ip=10.204.155.69; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of steve@sakoman.com
	designates 10.204.155.69 as permitted sender)
	smtp.mail=steve@sakoman.com
Received: from mr.google.com ([10.204.155.69])
	by 10.204.155.69 with SMTP id r5mr14830504bkw.118.1329863209532
	(num_hops = 1); Tue, 21 Feb 2012 14:26:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.155.69 with SMTP id r5mr11975711bkw.118.1329863209256;
	Tue, 21 Feb 2012 14:26:49 -0800 (PST)
Received: by 10.204.154.23 with HTTP; Tue, 21 Feb 2012 14:26:49 -0800 (PST)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <1329861178.20261.62.camel@ted>
References: <1329851229-31625-1-git-send-email-steve@sakoman.com>
	<1329861178.20261.62.camel@ted>
Date: Tue, 21 Feb 2012 14:26:49 -0800
Message-ID: <CAOSpxdabeX7TrUa_xGKAjdTS_NtmVRR+Y_Jz_27PkvXx9XNWPQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnjAljDOq0JNQv2oafTVpJV49OBuV+gjTumO/OY23JwNUbfXcYVHHo3zOVh3yk9uFws3g+O
Subject: Re: [PATCH] libxml2: add missing dependency on binutils
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
X-List-Received-Date: Tue, 21 Feb 2012 22:35:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 1:52 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-02-21 at 11:07 -0800, Steve Sakoman wrote:
>> Otherwise build fails with following error:
>>
>> | In file included from libxml.h:36:0,
>> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from xmlmemory.c:8:
>> | ./include/libxml/xmlversion.h:396:22: fatal error: ansidecl.h: No such=
 file or directory
>>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>> =A0meta/recipes-core/libxml/libxml2.inc | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/li=
bxml/libxml2.inc
>> index 0979acd..6230f60 100644
>> --- a/meta/recipes-core/libxml/libxml2.inc
>> +++ b/meta/recipes-core/libxml/libxml2.inc
>> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Dbb90c4892=
6316d9af6e2d70ca7013ade \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://trio.c;beginline=3D5;e=
ndline=3D14;md5=3D6c025753c86d958722ec76e94cae932e"
>>
>> =A0DEPENDS_virtclass-native =3D "python-native"
>> -DEPENDS =3D+ "zlib"
>> +DEPENDS =3D+ "zlib binutils"
>>
>> =A0SRC_URI =3D "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://libxml-64bit.patch"
>
> This sounds very wrong. It would have implications for libxml2-native
> I'd imagine. What is it doing that needs binutils?

For some reason the libxml2 configure phase decides that ansidecl.h
from binutils is present, but then at compile time it finds that it
actually isn't there!  I saw the same issue on both my desktop and
autobuilder setups.

I'll try a clean build to see if the problem persists.  The libz
change from last week seems to have put my builds in a bad state, and
the PR bumps intended to fix things really don't seem to be fixing
things, at least on my build machines.  I suspect it might be faster
to do a clean build than to track down where the corruption is.

Steve


