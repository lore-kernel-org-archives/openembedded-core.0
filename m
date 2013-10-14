Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 708276CFE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 15:54:42 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VVkTj-0007SV-W7 from Paul_Woegerer@mentor.com ;
	Mon, 14 Oct 2013 08:54:44 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 14 Oct 2013 08:54:43 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.2.247.3; Mon, 14 Oct 2013 16:54:41 +0100
Message-ID: <525C13C0.4020805@mentor.com>
Date: Mon, 14 Oct 2013 17:54:40 +0200
From: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 14 Oct 2013 15:54:43.0880 (UTC)
	FILETIME=[B32AEA80:01CEC8F5]
Cc: Christopher Larson <chris_larson@mentor.com>,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: lttng-modules may trigger deadlock in the timekeeping subsystem with Linux <= 3.10.13, <= 3.11.2
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
X-List-Received-Date: Mon, 14 Oct 2013 15:54:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

looking at the following commits shows that the current version of
lttng-modules 2.3.x can trigger a deadlock in the timekeeping subsystem
of Linux.

http://git.lttng.org/?p=lttng-modules.git;a=commit;h=fc8216ae9ec5d18172d8227d179475e7cc1fb45c
http://git.lttng.org/?p=lttng-modules.git;a=commit;h=9998f5216f4641a79e158135c4c1658dcc6cd2d8
http://git.lttng.org/?p=lttng-modules.git;a=commit;h=e14bf96416c39675a5f785b032d1c5279020b93d

This is caused by a bug in the kernel that was introduced in 3.10. The
problem is already fixed in Linux 3.10.14, 3.11.3 and 3.12. See:
http://marc.info/?l=linux-kernel&m=137894350929349

lttng-modules 2.3.2 contains preprocessor-code that makes sure that
building of lttng-modules fails for the unlucky combinations of kernel
and lttng-modules. The problem is when we update our lttng-modules 2.3.0
to 2.3.2 then we would have lttng-modules failing to build for our qemu*
MACHINEs.

Any recommendations on how we should address this ?

Many thanks,
Paul

-- 
Paul Woegerer, SW Development Engineer
Sourcery Analyzer <http://go.mentor.com/sourceryanalyzer>
Mentor Graphics, Embedded Software Division

