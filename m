Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CFCCD71D45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 15:01:27 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1cS3M7-0000La-87 from Nathan_Lynch@mentor.com ;
	Fri, 13 Jan 2017 07:01:27 -0800
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 13 Jan 2017 07:01:24 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <87o9zctazq.fsf@wedge.i-did-not-set--mail-host-address--so-tickle-me>
References: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
	<1484089620-19725-5-git-send-email-nathan_lynch@mentor.com>
	<CAJTo0LZKcoocQ3wBjG78jakD6wsJE79Cnkq5N1n5hkv__8WmEw@mail.gmail.com>
	<87o9zctazq.fsf@wedge.i-did-not-set--mail-host-address--so-tickle-me>
Date: Fri, 13 Jan 2017 09:01:22 -0600
Message-ID: <87lguft35p.fsf@wedge.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] lttng-tools: upgrade to 2.9.3
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
X-List-Received-Date: Fri, 13 Jan 2017 15:01:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Nathan Lynch <nathan_lynch@mentor.com> writes:
> "Burton, Ross" <ross.burton@intel.com> writes:
>
>> This upgrade is failing on the autobuilders:
>>
>> DEBUG: Executing shell function do_install_ptest_base
>> install: failed to access
>> =E2=80=98TOPDIR/tmp/work/mips64-poky-linux/lttng-tools/2.9.3-r0/image/us=
r/lib/lttng-tools/ptest/tests/destructive=E2=80=99:
>> No such file or directory
>
> I'm unable to recreate this so far.  Any idea what's going on here?
>
> Here's the relevant code from the recipe's do_install_ptest:
>
>     # Copy the tests directory tree and the executables and
>     # Makefiles found within.
>     for d in $(find "${B}/tests" -type d -not -name .libs -printf '%P ') =
; do
>         find "${B}/tests/$d" -maxdepth 1 -executable -type f \
>             -exec install -D -t "${D}${PTEST_PATH}/tests/$d" {} +
>         test -r "${B}/tests/$d/Makefile" && \
>             install -D -t "${D}${PTEST_PATH}/tests/$d" "${B}/tests/$d/Mak=
efile"
>     done
>
> And the contents of ${B}/tests/destructive/:
> -rwxr-xr-x. 3 nathanl nathanl 19298 Jan 12 10:42 Makefile
> -rwxr-xr-x. 3 nathanl nathanl  6547 Jan 12 10:44 metadata-regeneration
>
> I'm guessing it's something like a directory creation race but I can't
> see it.

This seems like a plausible explanation (a difference in install -D
behavior):

http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3D6c65ce4c643b038=
c61bd332aab5ea87a75117273

I've got coreutils 8.25 here; I assume the version on the autobuilder is
older than that but newer than 6.2.

I'll verify this theory and likely respin to work around the old
coreutils.

