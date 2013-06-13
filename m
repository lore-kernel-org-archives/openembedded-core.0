Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E091F61EBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 21:18:21 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Jun 2013 14:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,861,1363158000"; d="scan'208";a="316691799"
Received: from unknown (HELO [10.255.13.2]) ([10.255.13.2])
	by azsmga001.ch.intel.com with ESMTP; 13 Jun 2013 14:18:21 -0700
Message-ID: <51BA371D.8030609@linux.intel.com>
Date: Thu, 13 Jun 2013 14:18:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1371000065-23866-1-git-send-email-net147@gmail.com>
In-Reply-To: <1371000065-23866-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Qt fixes
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
X-List-Received-Date: Thu, 13 Jun 2013 21:18:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2013 06:21 PM, Jonathan Liu wrote:
> A couple of Qt fixes. These have been tested by Paul Eggleton.
> I have fixed some typos in the commit message for Felipe's patch and
> dropped the note regarding the build system going crazy as requested by
> Paul.
>
> Felipe F. Tonello (1):
>    qt: update qmake2 class to export qconfig.pri mkspec
>
> Jonathan Liu (1):
>    classes/qmake_base: allow parallel make
>
>   meta/classes/qmake2.bbclass     | 1 +
>   meta/classes/qmake_base.bbclass | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
>

Jonathan,

I think your patches may be causing this failure:

> | mv -f libQtFeedbackE.so.1.2.0 libQtFeedbackE.so libQtFeedbackE.so.1 libQtFeedbackE.so.1.2 ../../lib/
> | { test -z "../../lib/" || cd "../../lib/"; } && test $(gdb --version | sed -e 's,[^0-9]\+\([0-9]\)\.\([0-9]\).*,\1\2,;q') -gt 72 && gdb --nx --batch --quiet -ex 'set confirm off' -ex "save gdb-index ." -ex quit 'libQtFeedbackE.so.1.2.0' && test -f libQtFeedbackE.so.1.2.0.gdb-index && objcopy --add-section '.gdb_index=libQtFeedbackE.so.1.2.0.gdb-index' --set-section-flags '.gdb_index=readonly' 'libQtFeedbackE.so.1.2.0' 'libQtFeedbackE.so.1.2.0' && rm -f libQtFeedbackE.so.1.2.0.gdb-index || true
> | /bin/sh: gdb: command not found
> | /bin/sh: line 0: test: -gt: unary operator expected

See the world build log:
http://autobuilder.yoctoproject.org:8011/builders/nightly-world/builds/169/steps/Building%20Images/logs/stdio

I did not catch this as I have gdb installed locally, but this does not 
seem very cross-compile friendly and we have not seen it before.

Thanks for looking into this.

Sau!




