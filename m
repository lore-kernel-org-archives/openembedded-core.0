Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E5D557316D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 17:11:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jan 2017 09:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,290,1477983600"; d="scan'208";a="1118215396"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jan 2017 09:11:39 -0800
Date: Thu, 26 Jan 2017 19:11:30 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170126171129.GA19664@mbabyjoh-desk.ger.corp.intel.com>
References: <1485165540-16646-1-git-send-email-maxin.john@intel.com>
	<1485165540-16646-2-git-send-email-maxin.john@intel.com>
	<CAJTo0Lb8z9QbKF5qebO+54tqPe9rnZEXSd7EHMgXnK6XAZ1Lsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb8z9QbKF5qebO+54tqPe9rnZEXSd7EHMgXnK6XAZ1Lsw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] libtasn1: Upgrade 4.9 -> 4.10
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
X-List-Received-Date: Thu, 26 Jan 2017 17:11:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

>On Thu, Jan 26, 2017 at 10:20:16AM +0000, Burton, Ross wrote:
>>On 23 January 2017 at 09:58, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>    Removed the following Backported patches:
>>         1. 0001-configure-don-t-add-Werror-to-build-flags.patch
>
> This breaks on musl in the most amusing way:
>
> |                  from ../../libtasn1-4.10/gl/getopt.c:28:
> | ./stdint.h:89:5: error: #if with no expression
> |  #if
> |      ^
>

For some strange reasons, this build error hasn't occured in my musl
test build before sending the patch. 

> When it says stdint.h it doesn't mean the system stdint.h because that
> would be too sensible.  libtasn1 uses gnulib which writes its own system
> headers, so this is in fact build/gl/stdint.h which does indeed just 
> do '#if '.  The source for this file is gl/stdint.in.h in this block:
>
> /* Override WINT_MIN and WINT_MAX if gnulib's <wchar.h> or <wctype.h> overrides
> wint_t.  */
> #if @GNULIB_OVERRIDES_WINT_T@
> # undef WINT_MIN
> # undef WINT_MAX
> # define WINT_MIN 0x0U
> # define WINT_MAX 0xffffffffU
> #endif
>
>For some reason when this executes @GNULIB_OVERRIDES_WINT_T@ isn't defined.

The build error is due to this change:
http://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=5a400b3f5a1f5483dbfd75d38bdb7080218a063b

*  m4/stdint.m4 (gl_STDINT_H): Don't define GNULIB_OVERRIDES_WINT_T.

will send a v2 to fix this.

>Cheers,
>Ross

Thanks and Regards,
Maxin

