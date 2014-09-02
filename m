Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7799C6FCA3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 07:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s827Zkwd024246; Tue, 2 Sep 2014 08:35:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 96GkelqGMtqq; Tue,  2 Sep 2014 08:35:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s827ZhC8024243
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 2 Sep 2014 08:35:44 +0100
Message-ID: <1409643344.29296.262.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 02 Sep 2014 08:35:44 +0100
In-Reply-To: <540572C3.4080607@windriver.com>
References: <cover.1408340319.git.Chong.Lu@windriver.com>
	<d03fddc6174a0fefe406c4dae2daffcca218ce70.1408340319.git.Chong.Lu@windriver.com>
	<CAJTo0LZ89Wg1QfzYheNO0u2YWVTQFo58je1KqYPnKzJeKK+UGA@mail.gmail.com>
	<54052811.50209@windriver.com> <540572C3.4080607@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] piglit: enable ptest support
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
X-List-Received-Date: Tue, 02 Sep 2014 07:35:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-02 at 15:33 +0800, Robert Yang wrote:
> 
> On 09/02/2014 10:14 AM, Robert Yang wrote:
> >
> >
> > On 08/28/2014 10:09 PM, Burton, Ross wrote:
> >> On 18 August 2014 06:39, Chong Lu <Chong.Lu@windriver.com> wrote:
> >>> +env PIGLIT_BUILD_DIR=`pwd`/.. piglit-run.py `pwd`/tests/sanity.tests
> >>> `pwd`/results/sanity.results 2>&1
> >>
> >> You shouldn't need to set PIGLIT_BUILD_DIR.
> >>
> >> The sanity tests are very basic so this won't count as "running
> >> piglit" in any meaningful QA sense.
> >>
> >>> @@ -36,7 +37,6 @@ do_install() {
> >>>          cp -Pr lib/ ${D}${libdir}/piglit/
> >>>          cp -Pr framework/ ${D}${libdir}/piglit/
> >>>          cp -Pr generated_tests/ ${D}${libdir}/piglit/
> >>> -       cp -Pr tests/ ${D}${libdir}/piglit/
> >>>          cp -Pr templates/ ${D}${libdir}/piglit/
> >>>
> >>>          sed -i -e
> >>> 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|'
> >>> ${D}${bindir}/piglit-*.py
> >>> @@ -46,3 +46,7 @@ do_install() {
> >>>   FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
> >>>
> >>>   RDEPENDS_${PN} = "python waffle python-json python-subprocess
> >>> python-multiprocessing python-textutils python-netserver python-shell
> >>> mesa-demos"
> >>> +
> >>> +do_install_ptest() {
> >>> +       cp -Pr tests/ ${D}${PTEST_PATH}/
> >>> +}
> >>
> >> Why move the tests directory to the -ptests package?  That makes
> >> piglit unusable without installing piglit-ptest.
> >
> > Hello, if we keep the tests dir in piglit, shall we add perl to
> 
> Sorry, bash, in fact.

A bash dependency on the piglit recipe isn't an issue. Its only an issue
where it forces bash or perl into "small" builds. If you're including
piglit, its not a small build :)

Cheers,

Richard


