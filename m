Return-Path: <niqingliang2003@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1196ACE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 11:28:03 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cc10so2341692wib.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 04:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=aAJTrYaEDXbUZYvOMpc2UgzWPtfFkb3IA7YCm+vyyqw=;
	b=teqLpZFdVsVRWjEtwMOF1JmrPORJvZ6YNHpXjrhEZSLxsM4WOfMt7kMfvzO8jNA/TM
	5P3ZVcBGI7jZ/08d9lc2rYj50lFEZCzJ+jpVDHclBJ4PscBEBX0LlGay42rN7eIIWtc3
	WpLqWmkZ4bI4BNQb09KzHL6RnRCVPr+qBWQOs0wofMTdqTTc2+zc1kNJDxZGuiUQ1Bxz
	6FpaNqVsKBn7D37DUhxdwKi3RFb7yupUbO+4h1SSMMJ17/ZEZ4PEaTzV41Aa7B02BFsX
	LBiGZ0Hyd7HEjOhGvS/iEmQR5vYWl6vkU3cmg1G8k31zhW1pn09A47Q9PjCLQZSaJJRx
	7w7A==
MIME-Version: 1.0
X-Received: by 10.180.75.203 with SMTP id e11mr3325357wiw.28.1409311684519;
	Fri, 29 Aug 2014 04:28:04 -0700 (PDT)
Received: by 10.217.141.72 with HTTP; Fri, 29 Aug 2014 04:28:04 -0700 (PDT)
Date: Fri, 29 Aug 2014 11:28:04 +0000
Message-ID: <CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: boost 1.56 compile fail
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
X-List-Received-Date: Fri, 29 Aug 2014 11:28:07 -0000
Content-Type: multipart/alternative; boundary=f46d0438958f556dd70501c2f2fc

--f46d0438958f556dd70501c2f2fc
Content-Type: text/plain; charset=UTF-8

hardware: samsung s3c6410

after updated to latest poky, the boost compile fail!

error info:
libs/atomic/src/lockpool.cpp:127:5: error: 'thread_fence' is not a member
of 'boost::atomics::detail'
libs/atomic/src/lockpool.cpp:138:5: error: 'signal_fence' is not a member
of 'boost::atomics::detail'


after dig into it, I found that:
the marco 'BOOST_ATOMIC_FLAG_LOCK_FREE' is 0, so it don't include
'operations_lockfree.hpp' which has 'thread_fence' and 'signal_fence', but
pthread.h at line 21.

in file 'caps_gcc_atomic.hpp', 'BOOST_ATOMIC_FLAG_LOCK_FREE' is set to '0',
the author think if '__GCC_ATOMIC_BOOL_LOCK_FREE' is 1, the atomic serial
function gcc provided is not lock free.

at the end of 'caps_gcc_atomic.hpp', it defined 'BOOST_ATOMIC_THREAD_FENCE'
as 2.

so the conflict is: *BOOST_ATOMIC_THREAD_FENCE* and
*BOOST_ATOMIC_FLAG_LOCK_FREE*

I don't know it is the new poky problem, or the boost problem, any idea?


Yi Qingliang

--f46d0438958f556dd70501c2f2fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hardware: samsung s3c6410<br><br>after updated to latest p=
oky, the boost compile fail!<br><br>error info:<div><div>libs/atomic/src/lo=
ckpool.cpp:127:5: error: &#39;thread_fence&#39; is not a member of &#39;boo=
st::atomics::detail&#39;<br>
</div><div>libs/atomic/src/lockpool.cpp:138:5: error: &#39;signal_fence&#39=
; is not a member of &#39;boost::atomics::detail&#39;</div></div><div><br><=
/div><div><br></div><div>after dig into it, I found that:</div><div>the mar=
co &#39;BOOST_ATOMIC_FLAG_LOCK_FREE&#39; is 0, so it don&#39;t include &#39=
;operations_lockfree.hpp&#39; which has &#39;thread_fence&#39; and &#39;sig=
nal_fence&#39;, but pthread.h at line 21.<br>
<br></div><div>in file &#39;caps_gcc_atomic.hpp&#39;, &#39;BOOST_ATOMIC_FLA=
G_LOCK_FREE&#39; is set to &#39;0&#39;, the author think if &#39;__GCC_ATOM=
IC_BOOL_LOCK_FREE&#39; is 1, the atomic serial function gcc provided is not=
 lock free.</div>
<div><br></div><div>at the end of &#39;caps_gcc_atomic.hpp&#39;, it defined=
 &#39;BOOST_ATOMIC_THREAD_FENCE&#39; as 2.</div><div><br></div><div>so the =
conflict is: <b>BOOST_ATOMIC_THREAD_FENCE</b> and <b>BOOST_ATOMIC_FLAG_LOCK=
_FREE</b></div>
<div><b><br></b></div><div>I don&#39;t know it is the new poky problem, or =
the boost problem, any idea?</div><div><br></div><div><br></div><div>Yi Qin=
gliang</div></div>

--f46d0438958f556dd70501c2f2fc--
