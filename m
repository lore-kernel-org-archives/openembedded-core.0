Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWpIH-0000RK-QX
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 15:38:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 52F3E315C6D1;
	Tue, 22 May 2012 15:28:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id XE1wF5Z2J+V2; Tue, 22 May 2012 15:28:20 +0200 (CEST)
Received: from [172.22.22.61] (drms-590ec2e9.pool.mediaWays.net
	[89.14.194.233])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id ED30D315C6D0;
	Tue, 22 May 2012 15:28:19 +0200 (CEST)
Message-ID: <4FBB9471.6040905@opendreambox.org>
Date: Tue, 22 May 2012 15:28:17 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1337686647-1027-1-git-send-email-obi@opendreambox.org>
	<2080721.YZu0iU2L4T@helios>
In-Reply-To: <2080721.YZu0iU2L4T@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qt4(-embedded).inc: create variables to ease overriding
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
X-List-Received-Date: Tue, 22 May 2012 13:38:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 22.05.2012 14:51, Paul Eggleton wrote:
> On Tuesday 22 May 2012 13:37:25 Andreas Oberritter wrote:
>> * No functional change besides ordering of configure arguments.
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>> * This doesn't cover all possible flags, but only those that I need
>>   to customize in my layer. Other flags may be added later if need
>>   arises.
>>
>>  meta/recipes-qt/qt4/qt4-embedded.inc |   12 +++++++++---
>>  meta/recipes-qt/qt4/qt4.inc          |   17 ++++++++++++++---
>>  2 files changed, 23 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc
>> b/meta/recipes-qt/qt4/qt4-embedded.inc index 8c15352..158ee17 100644
>> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
>> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
>> @@ -9,12 +9,18 @@ QT_BASE_LIB  ?= "libqt-embedded"
>>  # Set necessary variables in the profile
>>  SRC_URI += "file://qte.sh"
>>
>> +QT_DECORATION_FLAGS ?= ""
>> +QT_GFX_DRIVER_FLAGS ?= "-plugin-gfx-transformed -plugin-gfx-qvfb
>> -plugin-gfx-vnc -plugin-gfx-directfb" +QT_KBD_DRIVER_FLAGS ?= "-qt-kbd-tty"
>> +QT_MOUSE_DRIVER_FLAGS ?= "-plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb
>> -qt-mouse-linuxinput" +
>>  QT_CONFIG_FLAGS += " \
>>      -embedded ${QT_ARCH} \
>>      -qtlibinfix ${QT_LIBINFIX} \
>> -    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc
>> -plugin-gfx-directfb \ -    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb
>> -qt-mouse-linuxinput \ -    -qt-kbd-tty \
>> +    ${QT_DECORATION_FLAGS} \
>> +    ${QT_GFX_DRIVER_FLAGS} \
>> +    ${QT_KBD_DRIVER_FLAGS} \
>> +    ${QT_MOUSE_DRIVER_FLAGS} \
>>      -DQT_KEYPAD_NAVIGATION \
>>      "
>>
>> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
>> index 468a46f..c70b335 100644
>> --- a/meta/recipes-qt/qt4/qt4.inc
>> +++ b/meta/recipes-qt/qt4/qt4.inc
>> @@ -10,17 +10,28 @@ QT_ENDIAN = "${@qt_endian(d)}"
>>  QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"
>>  QT_DISTRO_FLAGS_linuxstdbase = "-sm"
>>
>> +QT_GLIB_FLAGS ?= "-glib"
>> +QT_IMAGEFORMAT_FLAGS ?= "-system-libjpeg -system-libpng -system-libtiff
>> -system-zlib" +QT_PHONON_FLAGS ?= "-phonon"
>> +QT_QDBUS_FLAGS ?= "-qdbus"
>> +QT_QT3SUPPORT_FLAGS ?= "-qt3support"
>>  QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql
>> -no-sql-odbc -plugin-sql-sqlite" +QT_WEBKIT_FLAGS ?= "-webkit"
>>
>>  QT_GLFLAGS ?= ""
>>
>>  QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
>>                      -shared -no-nas-sound -no-nis \
>> -                    -system-libjpeg -system-libpng -system-libtiff
>> -system-zlib \ -                    -no-pch -qdbus -stl -glib -phonon
>> -webkit \
>> -                    -xmlpatterns -no-rpath -qt3support -silent \
>> +                    -no-pch -stl \
>> +                    -xmlpatterns -no-rpath -silent \
>>                      ${@base_contains('DISTRO_FEATURES', 'pulseaudio',
>> '--enable-pulseaudio', '--disable-pulseaudio', d)} \ +                   
>> ${QT_GLIB_FLAGS} \
>> +                    ${QT_IMAGEFORMAT_FLAGS} \
>> +                    ${QT_PHONON_FLAGS} \
>> +                    ${QT_QDBUS_FLAGS} \
>> +                    ${QT_QT3SUPPORT_FLAGS} \
>>                      ${QT_SQL_DRIVER_FLAGS} \
>> +                    ${QT_WEBKIT_FLAGS} \
>>                      ${QT_DISTRO_FLAGS} \
>>                      ${QT_GLFLAGS}"
> 
> I think when we start getting to this level, especially because some of these 
> options imply extra DEPENDS, we should try to use PACKAGECONFIG rather than 
> specific variables.

Introducing PACKAGECONFIG is a more complex change. It can still be done
in a later patch. This patch just follows the semantics introduced by
QT_SQL_DRIVER_FLAGS and doesn't even require a PR bump.

Regards,
Andreas


