Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RYKoP-0003D0-0n
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 17:57:41 +0100
Received: (qmail 8627 invoked by uid 1003); 7 Dec 2011 16:44:11 -0000
Received: from unknown (HELO ?192.168.1.104?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	7 Dec 2011 16:44:11 -0000
Message-ID: <4EDF97DA.1070009@balister.org>
Date: Wed, 07 Dec 2011 11:44:10 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323273568-31152-1-git-send-email-philip@balister.org>	<1323273568-31152-2-git-send-email-philip@balister.org>
	<DCF0DA43-34BE-4AD2-8E13-536E6DCDF49A@dominion.thruhere.net>
In-Reply-To: <DCF0DA43-34BE-4AD2-8E13-536E6DCDF49A@dominion.thruhere.net>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH 2/2] qt4.inc : Add uic, moc, rcc, and lrelease to tools package.
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
X-List-Received-Date: Wed, 07 Dec 2011 16:57:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/07/2011 11:23 AM, Koen Kooi wrote:
> 
> Op 7 dec. 2011, om 16:59 heeft Philip Balister het volgende geschreven:
> 
>> These binaries are needed in the target tools package so we can build
>> qt apps on the target. You also need to install qmake from meta-oe.
>>
>> Test by building gnuradio on the USRP e100 with qt support.
>>
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>> meta/recipes-qt/qt4/qt4.inc |    9 ++-------
>> 1 files changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
>> index bec81b4..2638249 100644
>> --- a/meta/recipes-qt/qt4/qt4.inc
>> +++ b/meta/recipes-qt/qt4/qt4.inc
>> @@ -138,8 +138,8 @@ RRECOMMENDS_${QT_BASE_NAME}-qmlviewer += " \
>> RRECOMMENDS_${QT_BASE_NAME}-doc += " \
>>             ${QT_BASE_NAME}-demos-doc"
>>
>> -FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay ${bindir}/qdoc*"
>> -FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc*"
>> +FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay ${bindir}/qdoc* ${bindir}/moc ${bindir}/uic* ${bindir}/rcc"
>> +FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc* ${bindir}/.debug/uic* ${bindir}/.debug/moc ${bindir}/.debug/rcc"
>> FILES_${QT_BASE_NAME}-assistant            = "${bindir}/*assistant* ${bindir}/qcollectiongenerator ${bindir}/qhelpconverter ${bindir}/qhelpgenerator"
>> FILES_${QT_BASE_NAME}-assistant-dbg        = "${bindir}/.debug/*assistant* ${bindir}/.debug/qcollectiongenerator ${bindir}/.debug/qhelpconverter ${bindir}/.debug/qhelpgenerator"
>> FILES_${QT_BASE_NAME}-common               = "${bindir}/qtconfig"
>> @@ -287,11 +287,6 @@ do_install() {
>>
>> 	# These are host binaries, we should only use them in staging
>> 	rm ${D}/${bindir}/qmake
>> -	rm -f ${D}/${bindir}/uic
>> -	rm -f ${D}/${bindir}/uic3
>> -	rm ${D}/${bindir}/moc
>> -	rm ${D}/${bindir}/rcc
>> -	rm -f ${D}/${bindir}/lrelease
> 
> Can you verify that those are actually target binaries and not x86 ones?

root@usrp-e1xx:~# file /usr/bin/lrelease
/usr/bin/lrelease: ELF 32-bit LSB executable, ARM, version 1 (SYSV),
dynamically linked (uses shared libs), for GNU/Linux 2.6.16, stripped

root@usrp-e1xx:~# file /usr/bin/rcc
/usr/bin/rcc: ELF 32-bit LSB executable, ARM, version 1 (SYSV),
dynamically linked (uses shared libs), for GNU/Linux 2.6.16, stripp

root@usrp-e1xx:~# file /usr/bin/moc
/usr/bin/moc: ELF 32-bit LSB executable, ARM, version 1 (SYSV),
dynamically linked (uses shared libs), for GNU/Linux 2.6.16, stripped

root@usrp-e1xx:~# file /usr/bin/uic3
/usr/bin/uic3: ELF 32-bit LSB executable, ARM, version 1 (SYSV),
dynamically linked (uses shared libs), for GNU/Linux 2.6.16, stripp

root@usrp-e1xx:~# file /usr/bin/uic
/usr/bin/uic: ELF 32-bit LSB executable, ARM, version 1 (SYSV),
dynamically linked (uses shared libs), for GNU/Linux 2.6.16, stripped

Philip

> 
> regards,
> 
> Koen 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


