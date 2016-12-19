Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id B270B73190
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:32:50 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161219113250915_0484
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:32:50 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=58330 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cIwBQ-0003Yv-Sa for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2016 06:32:44 -0500
Date: Mon, 19 Dec 2016 06:31:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1612190624290.28360@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: minimal contents of a kernel config fragment
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
X-List-Received-Date: Mon, 19 Dec 2016 11:32:52 -0000
Content-Type: text/plain; charset=US-ASCII


  (ok, let's see if i can avoid embarrassing myself with an overly
simple question ...)

  reading YP kernel-dev manual, and there is an example of a kernel
config fragment:

  CONFIG_SERIAL_8250=y
  CONFIG_SERIAL_8250_CONSOLE=y
  CONFIG_SERIAL_8250_PCI=y
  CONFIG_SERIAL_8250_NR_UARTS=4
  CONFIG_SERIAL_8250_RUNTIME_UARTS=4
  CONFIG_SERIAL_CORE=y
  CONFIG_SERIAL_CORE_CONSOLE=y

all well and good, but is it clear that one can cut that down based on
the defaults in the Kconfig file? since the Kconfig file contains:

  config SERIAL_8250_NR_UARTS
        int "Maximum number of 8250/16550 serial ports"
        depends on SERIAL_8250
        default "4"
        help
          Set this to the number of serial ports you want the driver
          to support.  This includes any ports discovered via ACPI or
          PCI enumeration and any ports that may be added at run-time
          via hot-plug, or any ISA multi-port serial cards.

  config SERIAL_8250_RUNTIME_UARTS
        int "Number of 8250/16550 serial ports to register at runtime"
        depends on SERIAL_8250
        range 0 SERIAL_8250_NR_UARTS
        default "4"
        help
          Set this to the maximum number of serial ports you want
          the kernel to register at boot time.  This can be overridden
          with the module parameter "nr_uarts", or boot-time parameter
          8250.nr_uarts

is it accurate to say that the two fragment lines related to UARTs
could be omitted? (yes, it's more informative to have them there, but
technically, they're not required, correct?)

  similarly, another line could be omitted given the Kconfig lines:

  config SERIAL_8250
        tristate "8250/16550 and compatible serial support"
        select SERIAL_CORE

however, given the following in the same Kconfig file:

  config SERIAL_8250_DEPRECATED_OPTIONS
        bool "Support 8250_core.* kernel options (DEPRECATED)"
        depends on SERIAL_8250
        default y

if you didn't want deprecated options, you *would* have to explicitly
deselect that option with:

  # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set

yes?

  just making sure i'm not overlooking any subtleties.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


