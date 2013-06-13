Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 85AE26A4A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 23:51:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jun 2013 16:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,862,1363158000"; d="scan'208";a="353140556"
Received: from unknown (HELO [10.255.13.2]) ([10.255.13.2])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2013 16:51:55 -0700
Message-ID: <51BA5B1B.9030502@linux.intel.com>
Date: Thu, 13 Jun 2013 16:51:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<51AF6B79.3040506@linux.intel.com> <2054363.UxqkIOrzAJ@helios>
	<2653566.bBSFCXsGIZ@helios> <51B7B6CE.8040301@gmail.com>
	<51B9E32F.4080106@linux.intel.com> <51BA5759.8020806@gmail.com>
In-Reply-To: <51BA5759.8020806@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Thu, 13 Jun 2013 23:51:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/13/2013 04:35 PM, Jonathan Liu wrote:
> On 14/06/2013 1:20 AM, Saul Wold wrote:
>> On 06/11/2013 04:46 PM, Jonathan Liu wrote:
>>> On 6/06/2013 3:04 AM, Paul Eggleton wrote:
>>>> On Wednesday 05 June 2013 17:57:32 Paul Eggleton wrote:
>>>>> On Wednesday 05 June 2013 09:46:49 Saul Wold wrote:
>>>>>> On 06/05/2013 02:30 AM, Martin Jansa wrote:
>>>>>>> On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
>>>>>>>> qconfig.pri was not being loaded by qmake properly. This means Qt
>>>>>>>> qmake projects are unable to query QT_ARCH, QT_VERSION and other
>>>>>>>> variables defined in qconfig.pri.
>>>>>>>>
>>>>>>>> Export OE_QMAKE_QT_CONFIG, setting it to the location of
>>>>>>>> qconfig.pri
>>>>>>>> so that it can be located by qmake.
>>>>>>> There is such patch already:
>>>>>>> http://lists.openembedded.org/pipermail/openembedded-core/2013-May/07831
>>>>>>>
>>>>>>>
>>>>>>> 4.
>>>>>>> html
>>>>>> Got lost in my queue, adding it for the next MUT.
>>>>> FWIW I am still concerned by the assertion in the commit message
>>>>> about it
>>>>> causing undesirable behaviour. I'd want that checked out and the note
>>>>> removed before we look at merging this.
>>>> (I mean undesirable behaviour on rebuild after applying this patch; I
>>>> should
>>>> mention I'm testing this at the moment.)
>>>>
>>>> Cheers,
>>>> Paul
>>>>
>>> Looks like this was missed in the last pull.
>>>
>>
>> After some further local testing with this patch there was a problem
>> when I built world and it built qt-mobility-embedded, I got the
>> following error on multi-architectures
>>
>>> ake[3]: Entering directory
>>> `/srv/ssd/sgw/builds/world/tmp/work/x86_64-poky-linux/qt-mobility-embedded/1.2.0-r8/qt-mobility-opensource-src-1.2.0/examples/sensors/cubehouse'
>>>
>>> x86_64-poky-linux-g++  -m64
>>> --sysroot=/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64 -c -pipe
>>> -pipe -pipe -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g
>>> -feliminate-unused-debug-types -fpermissive
>>> -fvisibility-inlines-hidden -g -g -g -Wall -W -Wall -W -Wall -W
>>> -D_REENTRANT -DQT_OPENGL_LIB -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED
>>> -I/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/share/qtopia/mkspecs/linux-g++
>>> -I.
>>> -I/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/qtopia/QtCore
>>> -I/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/qtopia/QtGui
>>> -I/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/qtopia/QtOpenGL
>>> -I/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/qtopia -I../../../src/global
>>> -I../../../src/sensors -I../../../build/Debug/cubehouse/moc -o
>>> ../../../build/Debug/cubehouse/view.o view.cpp
>>> In file included from view.cpp:41:0:
>>> view.h:44:26: fatal error: QtOpenGL/qgl.h: No such file or directory
>>>  #include <QtOpenGL/qgl.h>
>>>                           ^
>>> compilation terminated.
> What does
> /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/qtopia/QtOpenGL
> contain?
>

Non existant!
ls  /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/qtopia/
phonon      QtDBus         QtHelp        QtScriptTools  QtUiTools
Qt          QtDeclarative  QtMultimedia  QtSql          QtWebKit
Qt3Support  QtDesigner     QtNetwork     QtSvg          QtXml
QtCore      QtGui          QtScript      QtTest         QtXmlPatterns



> Regards,
> Jonathan
>>> make[3]: *** [../../../build/Debug/cubehouse/view.o] Error 1
>>> make[3]: Leaving directory
>>> `/srv/ssd/sgw/builds/world/tmp/work/x86_64-poky-linux/qt-mobility-embedded/1.2.0-r8/qt-mobility-opensource-src-1.2.0/examples/sensors/cubehouse'
>>>
>>> make[2]: *** [sub-cubehouse-make_default] Error 2
>>> make[2]: *** Waiting for unfinished jobs....
>>
>>
>> So I have placed this on hold.
>>
>> SaU!
>
>
>

