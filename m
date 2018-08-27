Return-Path: <yang.wang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E495476078
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 22:17:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7RMHkFC029996
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:17:46 -0700
Received: from [128.224.56.219] (128.224.56.219) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 27 Aug 2018 15:17:45 -0700
Reply-To: <yang.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
References: <20180518085550.92085-1-mingli.yu@windriver.com>
	<5B1E1444.9000407@windriver.com>
	<30f93af9-5a38-059e-184f-bbbe52a01105@windriver.com>
From: Yang Wang <yang.wang@windriver.com>
Organization: Wind River
Message-ID: <f248ce00-4c47-7a70-9902-585960c5ccd4@windriver.com>
Date: Mon, 27 Aug 2018 18:17:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <30f93af9-5a38-059e-184f-bbbe52a01105@windriver.com>
Subject: Re: [PATCH] boost: add ptest support
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
X-List-Received-Date: Mon, 27 Aug 2018 22:17:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 08/27/2018 04:27 PM, Randy MacLeod wrote:
> On 06/11/2018 02:18 AM, Yu, Mingli wrote:
>> Ping.
>>
>> Thanks,
>>
>>
>> On 2018年05月18日 16:55, mingli.yu@windriver.com wrote:
>>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>>
>>> * Add a patch to remove rpath when compiling tests.
>>>
>>> * The rules for tests don't work in cross-compiling,
>>>    they try to run the executable after compiling and
>>>    linking the test program, so add a patch to hack
>>>    the rules, and add the running logic in run-ptest
>>>
>>> * There are 2000+ test cases for 26 added libs, I'm
>>>    not able to make all of them work for now and I think
>>>    ptest is not necessary to cover all of them, so add
>>>    a patch to remove some of the tests, which include:
>>>
>>>    - those require extra dependencies
>>>    - those require specific target hardware
>>>    - those require input data or config files
>>>    - those compile fail with unknown reason
>>>    - those require command parameters/options when running
>
> This thread got lost in the sands of time...
>
> With those changes, at least back in May, the results of ptest
> on qemux86-64 were:
>
> From Grace on an internal WR thread:
>>
>> And I also did a runtime test for boost on qemux86-64, it takes about 
>> 1h40m to finish the test.
>>
>> root@qemux86-64:/usr/lib64/boost/ptest# ./run-ptest
>> === Test Summary ===
>> TOTAL: 2331
>> PASSED: 2125
>> FAILED: 206
>>
>> The build time mainly costs about 30m, ever takes 23m36s and 42m24s 
>> respectively on the same build server.
>>
>>
>> Thanks,
>> Grace 
>
Not sure if it's worth to run the Ptest on QEMU though, I also run Ptest 
on SIMICS simulators, thousands of tests didn't get run, looks like the 
result was not good as well.

Now my nightly Ptest runs on x86 device and gets consistent result every 
day:

     2018-08-27T06:26 -- 2018-08-27T09:52
     Passed:  40518
     Failed:  289
     Skipped: 1876

Thanks,
Yang Wang
>
> It would be nice to add this to oe-core-2.6 but it
> isn't critical.
>
> enabling ptests for boost will cost quite a bit at
> build and test time but that's the price of getting boost.
>
> Any comments or concerns?
>
> Grace,
> I don't think that there's any rebase required, right?
>
> ../Randy
>
>
>>>
>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>> ---
>>>   meta/recipes-support/boost/boost.inc               |   66 +
>>>   .../boost/boost/0001-test-remove-some-tests.patch  | 1728 
>>> ++++++++++++++++++++
>>>   .../boost/boost/boost-remove-rpath.patch           |   28 +
>>>   .../boost-testing-hack-the-rules-for-ptest.patch   |   53 +
>>>   meta/recipes-support/boost/boost/run-ptest         |   41 +
>>>   5 files changed, 1916 insertions(+)
>>>   create mode 100644 
>>> meta/recipes-support/boost/boost/0001-test-remove-some-tests.patch
>>>   create mode 100644 
>>> meta/recipes-support/boost/boost/boost-remove-rpath.patch
>>>   create mode 100644 
>>> meta/recipes-support/boost/boost/boost-testing-hack-the-rules-for-ptest.patch 
>>>
>>>   create mode 100644 meta/recipes-support/boost/boost/run-ptest
>>>
>>> diff --git a/meta/recipes-support/boost/boost.inc 
>>> b/meta/recipes-support/boost/boost.inc
>>> index 6984bee777..cf9a5d41e2 100644
>>> --- a/meta/recipes-support/boost/boost.inc
>>> +++ b/meta/recipes-support/boost/boost.inc
>>> @@ -69,6 +69,27 @@ python __anonymous () {
>>>       d.setVar("BJAM_EXTRA", " ".join(extras))
>>>   }
>>>
>>> +inherit ptest
>>> +
>>> +SRC_URI_append = " \
>>> +    file://run-ptest \
>>> +    file://boost-remove-rpath.patch \
>>> +    file://boost-testing-hack-the-rules-for-ptest.patch \
>>> +    file://0001-test-remove-some-tests.patch \
>>> +"
>>> +# Required by some of the tests
>>> +FILES_${PN}-ptest += " \
>>> +    ${libdir}/libboost_regex_extra.so.* \
>>> +    ${libdir}/libboost_regex_recursive.so.* \
>>> +    ${libdir}/liba.so.* \
>>> +    ${libdir}/libsingle_instance_lib2.so.* \
>>> +    ${libdir}/libsingle_instance_lib1.so.* \
>>> +    ${libdir}/libdisable-lib_*.so.* \
>>> +    ${libdir}/libdll_*.so.* \
>>> +    ${libdir}/libthrow_test.so.* \
>>> +"
>>> +RDEPENDS_${PN}-ptest = "coreutils"
>>> +
>>>   # Override the contents of specific packages
>>>   FILES_${PN}-graph_parallel = "${libdir}/libboost_graph_parallel.so.*"
>>>   FILES_${PN}-locale = "${libdir}/libboost_locale.so.*"
>>> @@ -181,6 +202,51 @@ do_compile() {
>>>           --debug-configuration
>>>   }
>>>
>>> +do_compile_ptest() {
>>> +    for lib in ${BOOST_LIBS}; do
>>> +        # ignore python3 since there is no such
>>> +        # sub-dir in libs
>>> +        [ ${lib} = "python3" ] && continue
>>> +
>>> +        cd ${S}/libs/${lib}/test
>>> +        [ -f build/Jamfile.v2 ] && cd build
>>> +        bjam ${BJAM_OPTS} --prefix=${prefix} \
>>> +            --exec-prefix=${exec_prefix} \
>>> +            --libdir=${libdir} \
>>> +            --includedir=${includedir}
>>> +    done
>>> +}
>>> +
>>> +do_install_ptest() {
>>> +    build_bin="${S}/${TARGET_SYS}/boost/bin.v2"
>>> +
>>> +    for lib in ${BOOST_LIBS}; do
>>> +        # ignore python3 since there is no such
>>> +        # sub-dir in libs
>>> +        [ "${lib}" = "python3" ] && continue
>>> +
>>> +        install -d ${D}/${PTEST_PATH}/${lib}
>>> +        lib_test_dir="${build_bin}/libs/${lib}/test"
>>> +        for testdir in `ls -d ${lib_test_dir}/*.test 
>>> ${lib_test_dir}/build/*.test 2>/dev/null`; do
>>> +            testname=`basename ${testdir%.test}`
>>> +            testfile=`find ${testdir} -name ${testname}`
>>> +            if [ -n "${testfile}" -a -f "${testfile}" ]; then
>>> +                install -m 0755 ${testfile} ${D}${PTEST_PATH}/${lib}
>>> +            fi
>>> +        done
>>> +    done
>>> +
>>> +    extra_ptest_libs="libboost_regex_extra.so* 
>>> libboost_regex_recursive.so.* liba.so.* libsingle_instance_lib2.so.* 
>>> libsingle_instance_lib1.so.* libdisable-lib_*.so.* libdll_*.so* 
>>> libthrow_test.so*"
>>> +    for lib in ${extra_ptest_libs}; do
>>> +        f=`find ${build_bin}/libs -name ${lib}`
>>> +        if [ -n "${f}" ]; then
>>> +            install -m 0755 ${f} ${D}${libdir}
>>> +        fi
>>> +    done
>>> +
>>> +    sed -i 's/@BOOST_LIBS@/${BOOST_LIBS}/' ${D}${PTEST_PATH}/run-ptest
>>> +}
>>> +
>>>   do_install() {
>>>       bjam ${BJAM_OPTS} \
>>>           --libdir=${D}${libdir} \
>>> diff --git 
>>> a/meta/recipes-support/boost/boost/0001-test-remove-some-tests.patch 
>>> b/meta/recipes-support/boost/boost/0001-test-remove-some-tests.patch
>>> new file mode 100644
>>> index 0000000000..7d2f916822
>>> --- /dev/null
>>> +++ 
>>> b/meta/recipes-support/boost/boost/0001-test-remove-some-tests.patch
>>> @@ -0,0 +1,1728 @@
>>> +From fbe7f44aa39866ba6ce2948f143b098190e4a0e8 Mon Sep 17 00:00:00 2001
>>> +From: Mingli Yu <Mingli.Yu@windriver.com>
>>> +Date: Fri, 18 May 2018 16:37:02 +0800
>>> +Subject: [PATCH] test: remove some tests
>>> +
>>> +There are 2000+ test cases for 26 added libs, I'm
>>> +not able to make all of them work for now and I think
>>> +ptest is not necessary to cover all of them, so add
>>> +a patch to remove some of the tests, which include:
>>> +
>>> +* those require extra dependencies
>>> +* those require specific target hardware
>>> +* those require input data or config files
>>> +* those compile fail with unknown reasons
>>> +* those require command parameters/options when running
>>> +
>>> +Upstream-Status: Inappropriate [OE ptest specific]
>>> +
>>> +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>> +---
>>> + libs/atomic/test/Jamfile.v2        |    4 -
>>> + libs/context/test/Jamfile.v2       |   89 ---
>>> + libs/coroutine/test/Jamfile.v2     |    2 -
>>> + libs/graph/test/Jamfile.v2         |  112 ----
>>> + libs/locale/test/Jamfile.v2        |   21 -
>>> + libs/log/test/Jamfile.v2           |    2 +-
>>> + libs/math/test/Jamfile.v2          | 1047 
>>> ------------------------------------
>>> + libs/python/test/Jamfile           |  190 -------
>>> + libs/random/test/Jamfile.v2        |    1 -
>>> + libs/serialization/test/Jamfile.v2 |   54 --
>>> + libs/timer/test/Jamfile.v2         |   20 -
>>> + 11 files changed, 1 insertion(+), 1541 deletions(-)
>>> +
>>> +diff --git a/libs/atomic/test/Jamfile.v2 b/libs/atomic/test/Jamfile.v2
>>> +index ccab23d..079231e 100644
>>> +--- a/libs/atomic/test/Jamfile.v2
>>> ++++ b/libs/atomic/test/Jamfile.v2
>>> +@@ -22,11 +22,7 @@ project boost/atomic/test
>>> + test-suite atomic
>>> +     : [ run native_api.cpp ]
>>> +       [ run fallback_api.cpp ]
>>> +-      [ run atomicity.cpp ]
>>> +       [ run ordering.cpp ]
>>> +       [ run lockfree.cpp ]
>>> +-      [ compile-fail cf_arith_void_ptr.cpp ]
>>> +-      [ compile-fail cf_arith_func_ptr.cpp ]
>>> +-      [ compile-fail cf_arith_mem_ptr.cpp ]
>>> +       [ compile c_implicit_ctor.cpp ]
>>> +     ;
>>> +diff --git a/libs/context/test/Jamfile.v2 
>>> b/libs/context/test/Jamfile.v2
>>> +index 0f270bc..1aa2fdf 100644
>>> +--- a/libs/context/test/Jamfile.v2
>>> ++++ b/libs/context/test/Jamfile.v2
>>> +@@ -76,98 +76,9 @@ test-suite minimal :
>>> +                cxx11_rvalue_references
>>> +                cxx11_template_aliases
>>> +                cxx11_thread_local
>>> +-               cxx11_variadic_templates ] ]
>>> +-
>>> +-[ run test_fiber.cpp :
>>> +-    : :
>>> +-    <context-impl>fcontext
>>> +-    [ requires cxx11_auto_declarations
>>> +-               cxx11_constexpr
>>> +-               cxx11_defaulted_functions
>>> +-               cxx11_final
>>> +-               cxx11_hdr_thread
>>> +-               cxx11_hdr_tuple
>>> +-               cxx11_lambdas
>>> +-               cxx11_noexcept
>>> +-               cxx11_nullptr
>>> +-               cxx11_rvalue_references
>>> +-               cxx11_template_aliases
>>> +-               cxx11_thread_local
>>> +-               cxx11_variadic_templates ]
>>> +-    : test_fiber_asm ]
>>> +-
>>> +-[ run test_fiber.cpp :
>>> +-    : :
>>> +-    <conditional>@native-impl
>>> +-    [ requires cxx11_auto_declarations
>>> +-               cxx11_constexpr
>>> +-               cxx11_defaulted_functions
>>> +-               cxx11_final
>>> +-               cxx11_hdr_thread
>>> +-               cxx11_hdr_tuple
>>> +-               cxx11_lambdas
>>> +-               cxx11_noexcept
>>> +-               cxx11_nullptr
>>> +-               cxx11_rvalue_references
>>> +-               cxx11_template_aliases
>>> +-               cxx11_thread_local
>>> +-               cxx11_variadic_templates ]
>>> +-    : test_fiber_native ]
>>> +-
>>> +-[ run test_callcc.cpp :
>>> +-    : :
>>> +-    <context-impl>fcontext
>>> +-    [ requires cxx11_auto_declarations
>>> +-               cxx11_constexpr
>>> +-               cxx11_defaulted_functions
>>> +-               cxx11_final
>>> +-               cxx11_hdr_thread
>>> +-               cxx11_hdr_tuple
>>> +-               cxx11_lambdas
>>> +-               cxx11_noexcept
>>> +-               cxx11_nullptr
>>> +-               cxx11_rvalue_references
>>> +-               cxx11_template_aliases
>>> +-               cxx11_thread_local
>>> +-               cxx11_variadic_templates ]
>>> +-    : test_callcc_asm ]
>>> +-
>>> +-[ run test_callcc.cpp :
>>> +-    : :
>>> +-    <conditional>@native-impl
>>> +-    [ requires cxx11_auto_declarations
>>> +-               cxx11_constexpr
>>> +-               cxx11_defaulted_functions
>>> +-               cxx11_final
>>> +-               cxx11_hdr_thread
>>> +-               cxx11_hdr_tuple
>>> +-               cxx11_lambdas
>>> +-               cxx11_noexcept
>>> +-               cxx11_nullptr
>>> +-               cxx11_rvalue_references
>>> +-               cxx11_template_aliases
>>> +-               cxx11_thread_local
>>> +-               cxx11_variadic_templates ]
>>> +-    : test_callcc_native ]
>>> +-
>>> +-[ run test_execution_context_v2.cpp :
>>> +-    : :
>>> +-    [ requires cxx11_auto_declarations
>>> +-               cxx11_constexpr
>>> +-               cxx11_defaulted_functions
>>> +-               cxx11_final
>>> +-               cxx11_hdr_thread
>>> +-               cxx11_hdr_tuple
>>> +-               cxx11_lambdas
>>> +-               cxx11_noexcept
>>> +-               cxx11_nullptr
>>> +-               cxx11_rvalue_references
>>> +-               cxx11_template_aliases
>>> +-               cxx11_thread_local
>>> +                cxx11_variadic_templates ] ] ;
>>> +
>>> +
>>> +-
>>> + test-suite full :
>>> +     minimal ;
>>> +
>>> +diff --git a/libs/coroutine/test/Jamfile.v2 
>>> b/libs/coroutine/test/Jamfile.v2
>>> +index 3481e0f..1f9f0d6 100644
>>> +--- a/libs/coroutine/test/Jamfile.v2
>>> ++++ b/libs/coroutine/test/Jamfile.v2
>>> +@@ -28,6 +28,4 @@ project boost/coroutine/test
>>> +     ;
>>> +
>>> + test-suite "coroutine" :
>>> +-    [ run test_asymmetric_coroutine.cpp ]
>>> +-    [ run test_symmetric_coroutine.cpp ]
>>> +     ;
>>> +diff --git a/libs/graph/test/Jamfile.v2 b/libs/graph/test/Jamfile.v2
>>> +index 263365c..915b246 100644
>>> +--- a/libs/graph/test/Jamfile.v2
>>> ++++ b/libs/graph/test/Jamfile.v2
>>> +@@ -25,118 +25,6 @@ test-suite graph_test :
>>> +     [ run index_graph.cpp ]     # TODO: Make this part of the 
>>> test_graphs framework
>>> +     [ run labeled_graph.cpp ]
>>> +     [ run finish_edge_bug.cpp ]
>>> +-
>>> +-    [ run transitive_closure_test.cpp ]
>>> +-    [ compile adj_list_cc.cpp ]
>>> +-
>>> +-    # adj_list_test needs some work -JGS
>>> +-    # unit-test adj_list_test : adj_list_test.cpp  ;
>>> +-
>>> +-    [ run adj_list_edge_list_set.cpp ]
>>> +-    [ run adj_list_loops.cpp ]
>>> +-    [ compile adj_matrix_cc.cpp ]
>>> +-    [ run bfs.cpp ../../test/build//boost_test_exec_monitor ]
>>> +-    [ compile bfs_cc.cpp ]
>>> +-    [ run bellman-test.cpp ]
>>> +-    [ run betweenness_centrality_test.cpp : 100 ]
>>> +-    [ run bidir_remove_edge.cpp ]
>>> +-    [ run bipartite_test.cpp ]
>>> +-    # [ run csr_graph_test.cpp : : : : : <variant>release ]
>>> +-    [ run dag_longest_paths.cpp ]
>>> +-    [ run dfs.cpp ../../test/build//boost_test_exec_monitor ]
>>> +-    [ run undirected_dfs.cpp 
>>> ../../test/build//boost_test_exec_monitor ]
>>> +-    [ compile dfs_cc.cpp ]
>>> +-    [ compile dijkstra_cc.cpp ]
>>> +-    [ run dijkstra_heap_performance.cpp : 10000 ]
>>> +-    [ run dijkstra_no_color_map_compare.cpp : 10000 ]
>>> +-    [ run dominator_tree_test.cpp ]
>>> +-    [ run relaxed_heap_test.cpp : 5000 15000 ]
>>> +-    [ compile edge_list_cc.cpp ]
>>> +-    [ compile filtered_graph_cc.cpp ]
>>> +-    [ run generator_test.cpp ]
>>> +-    [ run graph.cpp ]
>>> +-    [ compile graph_concepts.cpp ]
>>> +-    [ run graphviz_test.cpp
>>> +- /boost/test//boost_test_exec_monitor/<link>static
>>> +-            ../build//boost_graph
>>> +-            ../../regex/build//boost_regex : --log_level=all ]
>>> +-    [ run metis_test.cpp : $(METIS_INPUT_FILE) ]
>>> +-    [ run gursoy_atun_layout_test.cpp ]
>>> +-    [ run layout_test.cpp : : : <test-info>always_show_run_output 
>>> <toolset>intel:<debug-symbols>off ]
>>> +-
>>> +-    [ run serialize.cpp
>>> +-          ../../serialization/build//boost_serialization
>>> +-      : : : ]
>>> +-
>>> +-    [ compile reverse_graph_cc.cpp ]
>>> +-    [ run sequential_vertex_coloring.cpp ]
>>> +-
>>> +-    # TODO: Merge these into a single test framework.
>>> +-    [ run subgraph.cpp ../../test/build//boost_test_exec_monitor ]
>>> +-    [ run subgraph_bundled.cpp ]
>>> +-    [ run subgraph_props.cpp ]
>>> +-
>>> +-    [ run isomorphism.cpp ../../test/build//boost_test_exec_monitor ]
>>> +-    [ run adjacency_matrix_test.cpp ]
>>> +-    [ compile vector_graph_cc.cpp ]
>>> +-    [ compile copy.cpp ]
>>> +-    [ compile swap.cpp ]
>>> +-    [ compile property_iter.cpp ]
>>> +-    [ run bundled_properties.cpp ]
>>> +-    [ run floyd_warshall_test.cpp ]
>>> +-    [ run astar_search_test.cpp ]
>>> +-    [ run biconnected_components_test.cpp ]
>>> +-    [ run cuthill_mckee_ordering.cpp ]
>>> +-    [ run king_ordering.cpp ]
>>> +-    [ run matching_test.cpp ]
>>> +-    [ run max_flow_test.cpp ]
>>> +-    [ run boykov_kolmogorov_max_flow_test.cpp ]
>>> +-    [ run cycle_ratio_tests.cpp ../build//boost_graph 
>>> ../../regex/build//boost_regex : $(CYCLE_RATIO_INPUT_FILE) ]
>>> +-    [ run basic_planarity_test.cpp ]
>>> +-    [ run make_connected_test.cpp ]
>>> +-    [ run make_bicon_planar_test.cpp ]
>>> +-    [ run make_maximal_planar_test.cpp ]
>>> +-    [ run named_vertices_test.cpp ]
>>> +-    [ run all_planar_input_files_test.cpp
>>> +-        ../../filesystem/build
>>> +-        ../../system/build
>>> +-        : $(PLANAR_INPUT_FILES) ]
>>> +-    [ run parallel_edges_loops_test.cpp
>>> +-        ../../filesystem/build
>>> +-        ../../system/build
>>> +-        : $(PLANAR_INPUT_FILES) ]
>>> +-    [ run r_c_shortest_paths_test.cpp ]
>>> +-    [ run rcsp_custom_vertex_id.cpp ]
>>> +-    [ run is_straight_line_draw_test.cpp ]
>>> +-    [ run metric_tsp_approx.cpp : metric_tsp_approx.graph ]
>>> +-    [ compile dimacs.cpp ]
>>> +-    [ run bron_kerbosch_all_cliques.cpp ]
>>> +-    [ run tiernan_all_cycles.cpp ]
>>> +-    [ run closeness_centrality.cpp ]
>>> +-    [ run degree_centrality.cpp ]
>>> +-    [ run mean_geodesic.cpp ]
>>> +-    [ run eccentricity.cpp ]
>>> +-    [ run clustering_coefficient.cpp ]
>>> +-    [ run core_numbers_test.cpp ]
>>> +-    [ run read_propmap.cpp ]
>>> +-    [ run mcgregor_subgraphs_test.cpp ../build//boost_graph ]
>>> +-    [ compile grid_graph_cc.cpp ]
>>> +-    [ run grid_graph_test.cpp ]
>>> +-    [ run incremental_components_test.cpp ]
>>> +-    [ run two_graphs_common_spanning_trees_test.cpp ]
>>> +-    [ run random_spanning_tree_test.cpp ../build//boost_graph ]
>>> +-    [ run graphml_test.cpp ../build//boost_graph : : 
>>> "graphml_test.xml" ]
>>> +-    [ run mas_test.cpp 
>>> ../../test/build//boost_unit_test_framework/<link>static : 
>>> $(TEST_DIR) ]
>>> +-    [ run stoer_wagner_test.cpp 
>>> ../../test/build//boost_unit_test_framework/<link>static : 
>>> $(TEST_DIR) ]
>>> +-    [ compile filtered_graph_properties_dijkstra.cpp ]
>>> +-    [ run vf2_sub_graph_iso_test.cpp ]
>>> +-    [ run vf2_sub_graph_iso_test_2.cpp ]
>>> +-    [ run hawick_circuits.cpp ]
>>> +-    [ run successive_shortest_path_nonnegative_weights_test.cpp 
>>> ../../test/build//boost_unit_test_framework/<link>static ]
>>> +-    [ run cycle_canceling_test.cpp 
>>> ../../test/build//boost_unit_test_framework/<link>static ]
>>> +-    [ run strong_components_test.cpp ]
>>> +-    [ run 
>>> find_flow_cost_bundled_properties_and_named_params_test.cpp 
>>> ../../test/build//boost_unit_test_framework/<link>static ]
>>> +-    [ run 
>>> max_flow_algorithms_bundled_properties_and_named_params.cpp 
>>> ../../test/build//boost_unit_test_framework/<link>static ]
>>> +     ;
>>> +
>>> + # Run SDB tests only when -sSDB= is set.
>>> +diff --git a/libs/locale/test/Jamfile.v2 b/libs/locale/test/Jamfile.v2
>>> +index db66db2..215cf37 100644
>>> +--- a/libs/locale/test/Jamfile.v2
>>> ++++ b/libs/locale/test/Jamfile.v2
>>> +@@ -21,35 +21,14 @@ project
>>> +
>>> + test-suite "boost_locale_test"
>>> +     :
>>> +-        # Configuration Information
>>> +-        [ run test_config.cpp : : : 
>>> <test-info>always_show_run_output ]
>>> +         # Shared
>>> +         [ run test_utf.cpp ]
>>> +-        [ run test_date_time.cpp ]
>>> +         [ run test_ios_prop.cpp ]
>>> +         [ run test_codecvt.cpp ]
>>> +-        [ run test_codepage_converter.cpp ]
>>> +-        [ run test_codepage.cpp ]
>>> +-        [ run test_message.cpp : $(BOOST_ROOT)/libs/locale/test ]
>>> +-        [ run test_generator.cpp ]
>>> +-        # icu
>>> +-        [ run test_collate.cpp ]
>>> +-        [ run test_convert.cpp ]
>>> +-        [ run test_boundary.cpp ]
>>> +-        [ run test_formatting.cpp : : : <optimization>off ]
>>> +-        [ run test_icu_vs_os_timezone.cpp ]
>>> +         # winapi
>>> +         [ run test_winapi_collate.cpp ]
>>> +         [ run test_winapi_convert.cpp ]
>>> +         [ run test_winapi_formatting.cpp ]
>>> +-        # posix
>>> +-        [ run test_posix_collate.cpp ]
>>> +-        [ run test_posix_convert.cpp ]
>>> +-        [ run test_posix_formatting.cpp ]
>>> +-        # std
>>> +-        [ run test_std_collate.cpp ]
>>> +-        [ run test_std_convert.cpp ]
>>> +-        [ run test_std_formatting.cpp ]
>>> +     ;
>>> +
>>> + # vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4
>>> +diff --git a/libs/log/test/Jamfile.v2 b/libs/log/test/Jamfile.v2
>>> +index 9fbbb03..7effa57 100644
>>> +--- a/libs/log/test/Jamfile.v2
>>> ++++ b/libs/log/test/Jamfile.v2
>>> +@@ -104,4 +104,4 @@ rule test_all
>>> +    return $(all_rules) ;
>>> + }
>>> +
>>> +-test-suite log : [ test_all r ] [ build-project ../example ] ;
>>> ++test-suite log : [ test_all r ] ;
>>> +diff --git a/libs/math/test/Jamfile.v2 b/libs/math/test/Jamfile.v2
>>> +index 749727f..ca9a742 100644
>>> +--- a/libs/math/test/Jamfile.v2
>>> ++++ b/libs/math/test/Jamfile.v2
>>> +@@ -92,1067 +92,22 @@ lib compile_test_main : compile_test/main.cpp ;
>>> +
>>> + test-suite special_fun :
>>> +    [ run hypot_test.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework ]
>>> +-   [ run pow_test.cpp ../../test/build//boost_unit_test_framework ]
>>> +-   [ run log1p_expm1_test.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run powm1_sqrtp1m1_test.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +    [ run special_functions_test.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_airy.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_bessel_j.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_bessel_y.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_bessel_i.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_bessel_k.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_bessel_j_prime.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_bessel_y_prime.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_bessel_i_prime.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_bessel_k_prime.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_beta.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_bessel_airy_zeros.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +    [ run test_bernoulli_constants.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_binomial_coeff.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_carlson.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-        <define>TEST1
>>> +-        : test_carlson_1  ]
>>> +-   [ run test_carlson.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-        <define>TEST2
>>> +-      : test_carlson_2  ]
>>> +-   [ run test_carlson.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-        <define>TEST3
>>> +-        : test_carlson_3  ]
>>> +-   [ run test_carlson.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-        <define>TEST4
>>> +-        : test_carlson_4  ]
>>> +-   [ run test_cbrt.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_difference.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_digamma.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_ellint_1.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_ellint_2.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_ellint_3.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_ellint_d.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_jacobi_zeta.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_heuman_lambda.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_erf.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_expint.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_factorials.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_gamma.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_hankel.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_hermite.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_ibeta.cpp  test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_float  ]
>>> +-   [ run test_ibeta.cpp  test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_double  ]
>>> +-   [ run test_ibeta.cpp  test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_long_double  ]
>>> +-   [ run test_ibeta.cpp  test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=1
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_real_concept1  ]
>>> +-   [ run test_ibeta.cpp  test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=2
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_real_concept2  ]
>>> +-   [ run test_ibeta.cpp  test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=3
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_real_concept3  ]
>>> +-   [ run test_ibeta.cpp  test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=4
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_real_concept4  ]
>>> +-
>>> +-   [ run test_ibeta_derivative.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_derivative_float  ]
>>> +-   [ run test_ibeta_derivative.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_derivative_double  ]
>>> +-   [ run test_ibeta_derivative.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_derivative_long_double  ]
>>> +-   [ run test_ibeta_derivative.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=1
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_derivative_real_concept1  ]
>>> +-   [ run test_ibeta_derivative.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=2
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_derivative_real_concept2  ]
>>> +-   [ run test_ibeta_derivative.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=3
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_derivative_real_concept3  ]
>>> +-   [ run test_ibeta_derivative.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=4
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_derivative_real_concept4  ]
>>> +-
>>> +-   [ run test_ibeta_inv.cpp  test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_float  ]
>>> +-   [ run test_ibeta_inv.cpp  test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_double  ]
>>> +-   [ run test_ibeta_inv.cpp  test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_long_double  ]
>>> +-   [ run test_ibeta_inv.cpp  test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=1
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_real_concept1  ]
>>> +-   [ run test_ibeta_inv.cpp  test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=2
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_real_concept2  ]
>>> +-   [ run test_ibeta_inv.cpp  test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=3
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_real_concept3  ]
>>> +-   [ run test_ibeta_inv.cpp  test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=4
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_real_concept4  ]
>>> +-   [ run test_ibeta_inv_ab.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_ab_float  ]
>>> +-   [ run test_ibeta_inv_ab.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_ab_double  ]
>>> +-   [ run test_ibeta_inv_ab.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_ab_long_double  ]
>>> +-   [ run test_ibeta_inv_ab.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=1
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_ab_real_concept1  ]
>>> +-   [ run test_ibeta_inv_ab.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=2
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_ab_real_concept2  ]
>>> +-   [ run test_ibeta_inv_ab.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=3
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_ibeta_inv_ab_real_concept3  ]
>>> +-   [ run test_igamma.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_igamma_inv.cpp test_instances//test_instances 
>>> pch_light  ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_igamma_inv_float  ]
>>> +-   [ run test_igamma_inv.cpp  test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_igamma_inv_double  ]
>>> +-   [ run test_igamma_inv.cpp  test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_igamma_inv_long_double  ]
>>> +-   [ run test_igamma_inv.cpp  test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_igamma_inv_real_concept  ]
>>> +-   [ run test_igamma_inva.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_igamma_inva_float  ]
>>> +-   [ run test_igamma_inva.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_igamma_inva_double  ]
>>> +-   [ run test_igamma_inva.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-      : test_igamma_inva_long_double  ]
>>> +-   [ run test_igamma_inva.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_igamma_inva_real_concept  ]
>>> +-   [ run test_instantiate1.cpp test_instantiate2.cpp  ]
>>> +-   [ run test_jacobi.cpp pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_laguerre.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_legendre.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework : : : [ 
>>> check-target-builds ../config//has_float128 "GCC libquadmath and 
>>> __float128 support" : <linkflags>"-Bstatic -lquadmath -Bdynamic" ]  ]
>>> +-   [ run chebyshev_test.cpp  : : : [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>"-Bstatic -lquadmath -Bdynamic" ] ]
>>> +-   [ run chebyshev_transform_test.cpp ../config//fftw3f : : : 
>>> <define>TEST1 [ requires cxx11_auto_declarations 
>>> cxx11_range_based_for ] [ check-target-builds ../config//has_fftw3 
>>> "libfftw3" : : <build>no ] : chebyshev_transform_test_1 ]
>>> +-   [ run chebyshev_transform_test.cpp ../config//fftw3 : : : 
>>> <define>TEST2 [ requires cxx11_auto_declarations 
>>> cxx11_range_based_for ] [ check-target-builds ../config//has_fftw3 
>>> "libfftw3" : : <build>no ] : chebyshev_transform_test_2 ]
>>> +-   [ run chebyshev_transform_test.cpp ../config//fftw3l : : : 
>>> <define>TEST3 [ requires cxx11_auto_declarations 
>>> cxx11_range_based_for ] [ check-target-builds ../config//has_fftw3 
>>> "libfftw3" : : <build>no ] : chebyshev_transform_test_3 ]
>>> +-   [ run chebyshev_transform_test.cpp ../config//fftw3q 
>>> ../config//quadmath : : : <define>TEST4 [ requires 
>>> cxx11_auto_declarations cxx11_range_based_for ] [ 
>>> check-target-builds ../config//has_fftw3 "libfftw3" : : <build>no ] 
>>> [ check-target-builds ../config//has_float128 "__float128" : : 
>>> <build>no ] : chebyshev_transform_test_4 ]
>>> +-
>>> +-   [ run test_ldouble_simple.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   # Needs to run in release mode, as it's rather slow:
>>> +-   [ run test_next.cpp pch 
>>> ../../test/build//boost_unit_test_framework : : : release  ]
>>> +-   [ run test_next_decimal.cpp pch 
>>> ../../test/build//boost_unit_test_framework : : : release  ]
>>> +-   [ run test_owens_t.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_polygamma.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_trigamma.cpp test_instances//test_instances 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_round.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_spherical_harmonic.cpp 
>>> test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_sign.cpp ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_tgamma_ratio.cpp test_instances//test_instances 
>>> pch_light ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_trig.cpp test_instances//test_instances pch_light 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_zeta.cpp ../../test/build//boost_unit_test_framework 
>>> test_instances//test_instances pch_light  ]
>>> +-   [ run test_tr1.cpp
>>> +-   ../build//boost_math_tr1
>>> +-   ../build//boost_math_tr1f
>>> +-   ../build//boost_math_c99
>>> +-   ../build//boost_math_c99f
>>> +-   ../../test/build//boost_unit_test_framework
>>> +-     ]
>>> +-
>>> +-   [ run test_tr1.cpp
>>> +-      ../build//boost_math_tr1l
>>> +-      ../build//boost_math_c99l
>>> +-      ../../test/build//boost_unit_test_framework
>>> +-      : : :
>>> +-      <define>TEST_LD=1
>>> +-      [ check-target-builds ../config//has_long_double_support 
>>> "long double support" : : <build>no ]
>>> +-      :
>>> +-      test_tr1_long_double
>>> +-     ]
>>> +-
>>> +-   [ run test_tr1.c
>>> +-      ../build//boost_math_tr1
>>> +-      ../build//boost_math_tr1f
>>> +-      ../build//boost_math_c99
>>> +-      ../build//boost_math_c99f
>>> +-      ../../test/build//boost_unit_test_framework
>>> +-      : : : #requirements
>>> +-      :
>>> +-      test_tr1_c
>>> +-    ]
>>> +-
>>> +-   [ run test_tr1.c
>>> +-      ../build//boost_math_tr1l
>>> +-      ../build//boost_math_c99l
>>> +-      ../../test/build//boost_unit_test_framework
>>> +-      : : :
>>> +-      <define>TEST_LD=1
>>> +-      [ check-target-builds ../config//has_long_double_support 
>>> "long double support" : : <build>no ]
>>> +-      :
>>> +-      test_tr1_c_long_double
>>> +-    ]
>>> + ;
>>> +
>>> + test-suite distribution_tests :
>>> +    [ run test_arcsine.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +    [ run test_bernoulli.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +    [ run test_beta_dist.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_binomial_float  ]
>>> +-   [ run test_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_binomial_double  ]
>>> +-   [ run test_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_binomial_long_double  ]
>>> +-   [ run test_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_ROUNDING=0
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_binomial_real_concept0  ]
>>> +-   [ run test_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_ROUNDING=1
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_binomial_real_concept1  ]
>>> +-   [ run test_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_ROUNDING=2
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_binomial_real_concept2  ]
>>> +-   [ run test_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_ROUNDING=3
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_binomial_real_concept3  ]
>>> +-   [ run test_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_ROUNDING=4
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_binomial_real_concept4  ]
>>> +-   [ run test_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_ROUNDING=5
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_binomial_real_concept5  ]
>>> +-   [ run test_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_ROUNDING=6
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_binomial_real_concept6  ]
>>> +-   [ run test_cauchy.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_chi_squared.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_dist_overloads.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_exponential_dist.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_extreme_value.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_find_location.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_find_scale.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_fisher_f.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_gamma_dist.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_geometric.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_hyperexponential_dist.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_hypergeometric_dist.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_QUANT=0
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_hypergeometric_dist0  ]
>>> +-   [ run test_hypergeometric_dist.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_QUANT=1
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_hypergeometric_dist1  ]
>>> +-   [ run test_hypergeometric_dist.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_QUANT=2
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_hypergeometric_dist2  ]
>>> +-   [ run test_hypergeometric_dist.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_QUANT=3
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_hypergeometric_dist3  ]
>>> +-   [ run test_hypergeometric_dist.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_QUANT=4
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_hypergeometric_dist4  ]
>>> +-   [ run test_hypergeometric_dist.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_QUANT=5
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_hypergeometric_dist5  ]
>>> +-   [ run test_inverse_chi_squared_distribution.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_inverse_gamma_distribution.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_inverse_gaussian.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_laplace.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_inv_hyp.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_logistic_dist.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_lognormal.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_negative_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_negative_binomial_float  ]
>>> +-   [ run test_negative_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_negative_binomial_double  ]
>>> +-   [ run test_negative_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_negative_binomial_long_double  ]
>>> +-   [ run test_negative_binomial.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_negative_binomial_real_concept  ]
>>> +-   [ run test_nc_chi_squared.cpp  pch 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_chi_squared_float  ]
>>> +-   [ run test_nc_chi_squared.cpp  pch 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_chi_squared_double  ]
>>> +-   [ run test_nc_chi_squared.cpp  pch 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_chi_squared_long_double  ]
>>> +-   [ run test_nc_chi_squared.cpp  pch 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_chi_squared_real_concept  ]
>>> +-   [ run test_nc_beta.cpp ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_beta_float  ]
>>> +-   [ run test_nc_beta.cpp ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_beta_double  ]
>>> +-   [ run test_nc_beta.cpp ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_beta_long_double  ]
>>> +-   [ run test_nc_beta.cpp ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=1
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_beta_real_concept1  ]
>>> +-   [ run test_nc_beta.cpp ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <define>TEST_DATA=2
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_beta_real_concept2  ]
>>> +-   [ run test_nc_f.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_nc_t.cpp  pch 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_t_float  ]
>>> +-   [ run test_nc_t.cpp  pch 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_t_double  ]
>>> +-   [ run test_nc_t.cpp  pch 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_t_long_double  ]
>>> +-   [ run test_nc_t.cpp  pch 
>>> ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_nc_t_real_concept  ]
>>> +-   [ run test_normal.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_pareto.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_poisson.cpp ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_FLOAT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_poisson_float  ]
>>> +-   [ run test_poisson.cpp ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_DOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_poisson_double  ]
>>> +-   [ run test_poisson.cpp ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_LDOUBLE
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_poisson_long_double  ]
>>> +-   [ run test_poisson.cpp ../../test/build//boost_unit_test_framework
>>> +-        : # command line
>>> +-        : # input files
>>> +-        : # requirements
>>> +-          <define>TEST_REAL_CONCEPT
>>> +-          <toolset>intel:<pch>off
>>> +-        : test_poisson_real_concept  ]
>>> +-   [ run test_rayleigh.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_students_t.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_skew_normal.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_trapezoidal.cpp 
>>> ../../test/build//boost_unit_test_framework : : : [ requires 
>>> cxx11_lambdas ]  ]
>>> +-   [ run test_triangular.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_uniform.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_weibull.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-
>>> +-   [ run  compile_test/dist_bernoulli_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_beta_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/dist_binomial_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_cauchy_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/dist_chi_squared_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_complement_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_exponential_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_extreme_val_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_find_location_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_find_scale_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_fisher_f_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_gamma_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/dist_inv_gamma_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_inv_chi_sq_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_hyperexponential_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_hypergeo_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_laplace_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_logistic_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_lognormal_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_neg_binom_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_nc_chi_squ_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_nc_beta_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_nc_f_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/dist_nc_t_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/dist_normal_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/dist_poisson_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_students_t_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_triangular_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_uniform_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/dist_weibull_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/distribution_concept_check.cpp  ]
>>> +-
>>> +-   [ run test_legacy_nonfinite.cpp 
>>> ../../test/build//boost_unit_test_framework ]
>>> +-   [ run test_basic_nonfinite.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_lexical_cast.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_nonfinite_trap.cpp 
>>> ../../test/build//boost_unit_test_framework : : : 
>>> <exception-handling>off:<build>no  ]
>>> +-   [ run test_signed_zero.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run complex_test.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> + ;
>>> +
>>> + test-suite misc :
>>> +-   [ run test_constants.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +    [ run test_print_info_on_type.cpp  ]
>>> +-   [ run test_barycentric_rational.cpp 
>>> ../../test/build//boost_unit_test_framework : : :  [ requires 
>>> cxx11_smart_ptr ] [ check-target-builds ../config//has_float128 "GCC 
>>> libquadmath and __float128 support" : <linkflags>-lquadmath ]  ]
>>> +    [ run test_constant_generate.cpp : : : release 
>>> <define>USE_CPP_FLOAT=1 <exception-handling>off:<build>no  ]
>>> +    [ run test_classify.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_cubic_b_spline.cpp 
>>> ../../test/build//boost_unit_test_framework : : :  [ requires 
>>> cxx11_smart_ptr cxx11_defaulted_functions ]  ]
>>> +-   [ run test_error_handling.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run legendre_stieltjes_test.cpp 
>>> ../../test/build//boost_unit_test_framework : : : [ requires 
>>> cxx11_auto_declarations cxx11_range_based_for ] [ 
>>> check-target-builds ../config//has_float128 "GCC libquadmath and 
>>> __float128 support" : <linkflags>"-Bstatic -lquadmath -Bdynamic" ]  ]
>>> +-   [ run test_minima.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_rationals.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-      test_rational_instances/test_rational_double1.cpp
>>> +-      test_rational_instances/test_rational_double2.cpp
>>> +-      test_rational_instances/test_rational_double3.cpp
>>> +-      test_rational_instances/test_rational_double4.cpp
>>> +-      test_rational_instances/test_rational_double5.cpp
>>> +-      test_rational_instances/test_rational_float1.cpp
>>> +-      test_rational_instances/test_rational_float2.cpp
>>> +-      test_rational_instances/test_rational_float3.cpp
>>> +-      test_rational_instances/test_rational_float4.cpp
>>> +-      test_rational_instances/test_rational_ldouble1.cpp
>>> +-      test_rational_instances/test_rational_ldouble2.cpp
>>> +-      test_rational_instances/test_rational_ldouble3.cpp
>>> +-      test_rational_instances/test_rational_ldouble4.cpp
>>> +-      test_rational_instances/test_rational_ldouble5.cpp
>>> +- test_rational_instances/test_rational_real_concept1.cpp
>>> +- test_rational_instances/test_rational_real_concept2.cpp
>>> +- test_rational_instances/test_rational_real_concept3.cpp
>>> +- test_rational_instances/test_rational_real_concept4.cpp
>>> +- test_rational_instances/test_rational_real_concept5.cpp
>>> +-   ]
>>> +-   [ run test_real_concept.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_remez.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_roots.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_root_iterations.cpp pch 
>>> ../../test/build//boost_unit_test_framework : : : [ requires 
>>> cxx11_hdr_tuple ]  ]
>>> +-   [ run test_root_finding_concepts.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_toms748_solve.cpp pch 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_policy.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_policy_2.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_policy_3.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_policy_4.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_policy_5.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_policy_6.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_policy_7.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_policy_8.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ compile test_policy_9.cpp  ]
>>> +-   [ run test_policy_sf.cpp 
>>> ../../test/build//boost_unit_test_framework  ]
>>> +-   [ run test_long_double_support.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-      : : : [ check-target-builds 
>>> ../config//has_long_double_support "long double support" : : 
>>> <build>no ] ]
>>> +-   [ run  compile_test/cubic_spline_incl_test.cpp 
>>> compile_test_main : : :  [ requires cxx11_smart_ptr 
>>> cxx11_defaulted_functions ]  ]
>>> +-   [ run  compile_test/barycentric_rational_incl_test.cpp 
>>> compile_test_main : : :  [ requires cxx11_smart_ptr 
>>> cxx11_defaulted_functions ]  ]
>>> +-   [ run  compile_test/compl_abs_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/compl_acos_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/compl_acosh_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/compl_asin_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/compl_asinh_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/compl_atan_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/compl_atanh_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_beta_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_bernoulli_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_bessel_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_bessel_deriv_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_binomial_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_cbrt_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_cos_pi_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_digamma_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_polygamma_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_ellint_1_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_ellint_2_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_ellint_3_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_ellint_d_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_jacobi_zeta_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_heuman_lambda_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_ellint_rc_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_ellint_rd_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_ellint_rf_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_ellint_rj_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_ellint_rg_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_erf_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_expint_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_expm1_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_factorials_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_fpclassify_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_gamma_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_hermite_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_hypot_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_laguerre_incl_test.cpp compile_test_main  ]
>>> +-   [ compile  compile_test/sf_lanczos_incl_test.cpp  ]
>>> +-   [ run  compile_test/sf_legendre_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_legendre_stieltjes_incl_test.cpp 
>>> compile_test_main : : : [ requires cxx11_auto_declarations ] ]
>>> +-   [ run  compile_test/sf_log1p_incl_test.cpp compile_test_main  ]
>>> +-   [ compile  compile_test/sf_math_fwd_incl_test.cpp  ]
>>> +-   [ run  compile_test/sf_modf_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_next_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_powm1_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_prime_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_relative_distance_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/sf_round_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_sign_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_sin_pi_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_sinc_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_sinhc_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_sph_harm_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_sqrt1pm1_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_trunc_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_ulp_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_zeta_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/std_real_concept_check.cpp  ]
>>> +-   [ compile compile_test/std_real_concept_check.cpp  : 
>>> <define>EMULATE32 : std_real_concept_check_32 ]
>>> +-   [ compile compile_test/std_real_concept_check.cpp  : 
>>> <define>EMULATE64 : std_real_concept_check_64 ]
>>> +-   [ compile compile_test/std_real_concept_check.cpp  : 
>>> <define>EMULATE80 : std_real_concept_check_80 ]
>>> +-   [ compile compile_test/std_real_concept_check.cpp  : 
>>> <define>EMULATE128 : std_real_concept_check_128 ]
>>> +-   [ run  compile_test/cstdfloat_concept_check_1.cpp
>>> +-      : : : [ check-target-builds ../config//has_intel_quad "Intel 
>>> _Quad datatype support" : 
>>> <cxxflags>-Qoption,cpp,--extended_float_type ]
>>> +-            [ check-target-builds ../config//has_float128 "GCC 
>>> libquadmath and __float128 support" : <linkflags>-lquadmath ] ]
>>> +-   [ run  compile_test/cstdfloat_concept_check_2.cpp  ]
>>> +-   [ run  compile_test/cstdfloat_concept_check_3.cpp  ]
>>> +-   [ run  compile_test/cstdfloat_concept_check_4.cpp  ]
>>> +-   [ run  compile_test/sf_airy_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_hankel_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_jacobi_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/sf_owens_t_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/dist_skew_norm_incl_test.cpp 
>>> compile_test_main  ]
>>> +-   [ run  compile_test/constants_incl_test.cpp compile_test_main  ]
>>> +-   [ run  compile_test/trapezoidal_incl_test.cpp compile_test_main  ]
>>> +-   [ compile  compile_test/test_traits.cpp  ]
>>> +-   [ compile  compile_test/tools_config_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_fraction_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_minima_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_polynomial_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_precision_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_rational_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_real_cast_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_remez_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_roots_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_series_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_solve_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_stats_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_test_data_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_test_inc_test.cpp  ]
>>> +-   [ compile  compile_test/tools_toms748_inc_test.cpp  ]
>>> +-   [ compile  compile_test/cubic_spline_concept_test.cpp : [ 
>>> requires cxx11_smart_ptr cxx11_defaulted_functions ]  ]
>>> +-   [ compile compile_test/barycentric_rational_concept_test.cpp :  
>>> [ requires cxx11_smart_ptr cxx11_defaulted_functions ]  ]
>>> +-   [ compile compile_test/sf_legendre_stieltjes_concept_test.cpp : 
>>> [ requires cxx11_auto_declarations cxx11_defaulted_functions 
>>> cxx11_lambdas ]   ]
>>> +-   [ compile  compile_test/trapezoidal_concept_test.cpp  ]
>>> +-   [ run octonion_test.cpp
>>> +-       ../../test/build//boost_unit_test_framework ]
>>> +-   [ run quaternion_constexpr_test.cpp ]
>>> +-   [ run quaternion_test.cpp
>>> +-       ../../test/build//boost_unit_test_framework : : : [ 
>>> check-target-builds ../config//has_float128 "GCC libquadmath and 
>>> __float128 support" : <linkflags>"-Bstatic -lquadmath -Bdynamic" ] ]
>>> +-   [ run quaternion_mult_incl_test.cpp
>>> +-       quaternion_mi1.cpp
>>> +-       quaternion_mi2.cpp
>>> +-       ../../test/build//boost_unit_test_framework ]
>>> +-   [ run test_polynomial.cpp 
>>> ../../test/build//boost_unit_test_framework : : : <define>TEST1 : 
>>> test_polynomial_1  ]
>>> +-   [ run test_polynomial.cpp 
>>> ../../test/build//boost_unit_test_framework : : : <define>TEST2 : 
>>> test_polynomial_2  ]
>>> +-   [ run test_polynomial.cpp 
>>> ../../test/build//boost_unit_test_framework : : : <define>TEST3 : 
>>> test_polynomial_3  ]
>>> +-   [ run polynomial_concept_check.cpp ]
>>> +-
>>> +-   [ compile multiprc_concept_check_1.cpp : <debug-symbols>off 
>>> <toolset>msvc:<cxxflags>/bigobj release 
>>> <exception-handling>off:<build>no  ]
>>> +-   [ compile multiprc_concept_check_2.cpp : <debug-symbols>off 
>>> <toolset>msvc:<cxxflags>/bigobj release 
>>> <exception-handling>off:<build>no  ]
>>> +-   [ compile multiprc_concept_check_3.cpp : <debug-symbols>off 
>>> <toolset>msvc:<cxxflags>/bigobj release 
>>> <exception-handling>off:<build>no  ]
>>> +-   [ compile multiprc_concept_check_4.cpp : <debug-symbols>off 
>>> <toolset>msvc:<cxxflags>/bigobj release 
>>> <exception-handling>off:<build>no  ]
>>> +-   [ compile ntl_concept_check.cpp : [ check-target-builds 
>>> ../config//has_ntl_rr : : <build>no ] <debug-symbols>off  ]
>>> +-   [ compile mpfr_concept_check.cpp : [ check-target-builds 
>>> ../config//has_mpfr_class : : <build>no ] <debug-symbols>off  ]
>>> +-   [ compile mpreal_concept_check.cpp : [ check-target-builds 
>>> ../config//has_mpreal : : <build>no ] <debug-symbols>off  ]
>>> +-   [ compile e_float_concept_check.cpp : [ check-target-builds 
>>> ../config//has_e_float : : <build>no ] <debug-symbols>off  ]
>>> +-
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : <define>TEST1 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_1 ]
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : <define>TEST1A [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_1a ]
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : <define>TEST2 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_2 ]
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : <define>TEST2A [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_2a ]
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : <define>TEST3 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_3 ]
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : <define>TEST3A [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_3a ]
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : release <define>TEST4 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_4 ]
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : release <define>TEST5 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_5 ]
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : <define>TEST6 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_6 ]
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : <define>TEST6A [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_6a ]
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : release <define>TEST7 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_7 ]
>>> +-   [ run  tanh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : release <define>TEST8 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax sfinae_expr ] :
>>> +-     tanh_sinh_quadrature_test_8 ]
>>> +-
>>> +-   [ run sinh_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : release [ check-target-builds ../config//has_float128 
>>> "GCC libquadmath and __float128 support" : <linkflags>-lquadmath ] [ 
>>> requires cxx11_auto_declarations cxx11_lambdas cxx11_smart_ptr 
>>> cxx11_unified_initialization_syntax ] ]
>>> +-   [ run exp_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : <define>TEST1 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ] [ requires cxx11_auto_declarations 
>>> cxx11_lambdas cxx11_smart_ptr cxx11_unified_initialization_syntax ] 
>>> : exp_sinh_quadrature_test_1 ]
>>> +-
>>> +-   [ run exp_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : release <define>TEST2 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> exp_sinh_quadrature_test_2 ]
>>> +-   [ run exp_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : <define>TEST3 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> exp_sinh_quadrature_test_3 ]
>>> +-   [ run exp_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : release <define>TEST4 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> exp_sinh_quadrature_test_4 ]
>>> +-   [ run exp_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : release <define>TEST5 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> exp_sinh_quadrature_test_5 ]
>>> +-   [ run exp_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : release <define>TEST6 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> exp_sinh_quadrature_test_6 ]
>>> +-   [ run exp_sinh_quadrature_test.cpp 
>>> ../../test/build//boost_unit_test_framework
>>> +-     : : : release <define>TEST7 [ check-target-builds 
>>> ../config//has_float128 "GCC libquadmath and __float128 support" : 
>>> <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> exp_sinh_quadrature_test_7 ]
>>> +-
>>> +-   [ run  compile_test/exp_sinh_incl_test.cpp compile_test_main : 
>>> : : [ requires cxx11_auto_declarations cxx11_lambdas cxx11_smart_ptr 
>>> cxx11_unified_initialization_syntax ] ]
>>> +-   [ run  compile_test/sinh_sinh_incl_test.cpp compile_test_main : 
>>> : : [ requires cxx11_auto_declarations cxx11_lambdas cxx11_smart_ptr 
>>> cxx11_unified_initialization_syntax ] ]
>>> +-   [ run  compile_test/tanh_sinh_incl_test.cpp compile_test_main : 
>>> : : [ requires cxx11_auto_declarations cxx11_lambdas cxx11_smart_ptr 
>>> cxx11_unified_initialization_syntax sfinae_expr ] ]
>>> +-   [ compile  compile_test/exp_sinh_concept_test.cpp : [ requires 
>>> cxx11_auto_declarations cxx11_lambdas cxx11_smart_ptr 
>>> cxx11_unified_initialization_syntax ] ]
>>> +-   [ compile  compile_test/sinh_sinh_concept_test.cpp : [ requires 
>>> cxx11_auto_declarations cxx11_lambdas cxx11_smart_ptr 
>>> cxx11_unified_initialization_syntax ] ]
>>> +-   [ compile  compile_test/tanh_sinh_concept_test.cpp : [ requires 
>>> cxx11_auto_declarations cxx11_lambdas cxx11_smart_ptr 
>>> cxx11_unified_initialization_syntax sfinae_expr ] ]
>>> +-
>>> +-   [ run gauss_quadrature_test.cpp : : : <define>TEST1 [ 
>>> check-target-builds ../config//has_float128 "GCC libquadmath and 
>>> __float128 support" : <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> gauss_quadrature_test_1 ]
>>> +-   [ run gauss_quadrature_test.cpp : : : <define>TEST2 [ 
>>> check-target-builds ../config//has_float128 "GCC libquadmath and 
>>> __float128 support" : <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> gauss_quadrature_test_2 ]
>>> +-   [ run gauss_kronrod_quadrature_test.cpp : : : <define>TEST1 [ 
>>> check-target-builds ../config//has_float128 "GCC libquadmath and 
>>> __float128 support" : <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> gauss_kronrod_quadrature_test_1 ]
>>> +-   [ run gauss_kronrod_quadrature_test.cpp : : : <define>TEST1A [ 
>>> check-target-builds ../config//has_float128 "GCC libquadmath and 
>>> __float128 support" : <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> gauss_kronrod_quadrature_test_1a ]
>>> +-   [ run gauss_kronrod_quadrature_test.cpp : : : <define>TEST2 [ 
>>> check-target-builds ../config//has_float128 "GCC libquadmath and 
>>> __float128 support" : <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> gauss_kronrod_quadrature_test_2 ]
>>> +-   [ run gauss_kronrod_quadrature_test.cpp : : : <define>TEST3 [ 
>>> check-target-builds ../config//has_float128 "GCC libquadmath and 
>>> __float128 support" : <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> gauss_kronrod_quadrature_test_3 ]
>>> +-   [ run adaptive_gauss_kronrod_quadrature_test.cpp : : : 
>>> <define>TEST1 [ check-target-builds ../config//has_float128 "GCC 
>>> libquadmath and __float128 support" : <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> adaptive_gauss_quadrature_test_1 ]
>>> +-   [ run adaptive_gauss_kronrod_quadrature_test.cpp : : : 
>>> <define>TEST1A [ check-target-builds ../config//has_float128 "GCC 
>>> libquadmath and __float128 support" : <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> adaptive_gauss_quadrature_test_1a ]
>>> +-   [ run adaptive_gauss_kronrod_quadrature_test.cpp : : : 
>>> <define>TEST2 [ check-target-builds ../config//has_float128 "GCC 
>>> libquadmath and __float128 support" : <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> adaptive_gauss_quadrature_test_2 ]
>>> +-   [ run adaptive_gauss_kronrod_quadrature_test.cpp : : : 
>>> <define>TEST3 [ check-target-builds ../config//has_float128 "GCC 
>>> libquadmath and __float128 support" : <linkflags>-lquadmath ]
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_smart_ptr cxx11_unified_initialization_syntax ] : 
>>> adaptive_gauss_quadrature_test_3 ]
>>> +-
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=1 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_1
>>> +-   ]
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=2 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_2
>>> +-   ]
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=3 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_3
>>> +-   ]
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=4 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_4
>>> +-   ]
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=5 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_5
>>> +-   ]
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=6 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_6
>>> +-   ]
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=7 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_7
>>> +-   ]
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=8 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_8
>>> +-   ]
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=9 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_9
>>> +-   ]
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=10 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_10
>>> +-   ]
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=11 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_11
>>> +-   ]
>>> +-   [ run naive_monte_carlo_test.cpp 
>>> ../../atomic/build//boost_atomic : : :
>>> +-     <define>TEST=12 <toolset>msvc:<cxxflags>-bigobj [ requires 
>>> cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread" : 
>>> naive_monte_carlo_test_12
>>> +-   ]
>>> +-   [ compile compile_test/naive_monte_carlo_incl_test.cpp 
>>> ../../atomic/build//boost_atomic :
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread"
>>> +-   ]
>>> +-   [ compile compile_test/naive_monte_carlo_concept_test.cpp 
>>> ../../atomic/build//boost_atomic :
>>> +-     [ requires cxx11_auto_declarations cxx11_lambdas 
>>> cxx11_unified_initialization_syntax cxx11_hdr_thread 
>>> cxx11_hdr_atomic cxx11_decltype cxx11_hdr_future cxx11_hdr_chrono 
>>> cxx11_hdr_random cxx11_allocator ]
>>> +-     <target-os>linux:<linkflags>"-pthread"
>>> +-   ]
>>> +-
>>> +-   [ compile compile_test/gauss_concept_test.cpp : [ requires 
>>> cxx11_auto_declarations cxx11_lambdas cxx11_smart_ptr 
>>> cxx11_unified_initialization_syntax ] ]
>>> +-   [ compile compile_test/gauss_kronrod_concept_test.cpp : [ 
>>> requires cxx11_auto_declarations cxx11_lambdas cxx11_smart_ptr 
>>> cxx11_unified_initialization_syntax ] ]
>>> +-
>>> +-   [ run test_numerical_differentiation.cpp 
>>> ../../test/build//boost_unit_test_framework  : : : [ requires 
>>> cxx11_auto_declarations cxx11_constexpr ] ]
>>> +-   [ run compile_test/numerical_differentiation_incl_test.cpp 
>>> compile_test_main  : : : [ requires cxx11_auto_declarations 
>>> cxx11_constexpr ] ]
>>> +-   [ compile 
>>> compile_test/numerical_differentiation_concept_test.cpp  : [ 
>>> requires cxx11_auto_declarations cxx11_constexpr ] ]
>>> +-   [ run __temporary_test.cpp test_instances//test_instances : : : 
>>> <test-info>always_show_run_output <pch>off ]
>>> + ;
>>> +
>>> +-build-project ../example ;
>>> +
>>> + rule get_float128_tests
>>> + {
>>> +@@ -1173,5 +128,3 @@ rule get_float128_tests
>>> +      }
>>> +      return $(result) ;
>>> + }
>>> +-
>>> +-test-suite float128_tests : [ get_float128_tests ] ;
>>> +diff --git a/libs/python/test/Jamfile b/libs/python/test/Jamfile
>>> +index 7f088cf..8125516 100644
>>> +--- a/libs/python/test/Jamfile
>>> ++++ b/libs/python/test/Jamfile
>>> +@@ -53,198 +53,8 @@ rule require-windows ( properties * )
>>> + test-suite python
>>> +   :
>>> +
>>> +-  [
>>> +-    run exec.cpp /boost/python//boost_python/<link>static $(PY)
>>> +-      : # program args
>>> +-      : exec.py # input files
>>> +-      : # requirements
>>> +-      : # target-name
>>> +-  ]
>>> +-
>>> +-  [
>>> +-    run exec.cpp ../build//boost_python/<link>shared /python//python
>>> +-      : # program args
>>> +-      : exec.py
>>> +-      : # requirements
>>> +-      : exec-dynamic # target-name
>>> +-  ]
>>> +-
>>> +-#   [
>>> +-#     run import_.cpp ../build//boost_python /python//python
>>> +-#       : # program args
>>> +-#       : import_.py # input files
>>> +-#       : # requirements
>>> +-#       : # target-name
>>> +-#   ]
>>> +-
>>> +-[
>>> +-bpl-test crossmod_exception
>>> +-  : crossmod_exception.py crossmod_exception_a.cpp 
>>> crossmod_exception_b.cpp
>>> +-]
>>> +-
>>> +-[ bpl-test injected ]
>>> +-[ bpl-test properties ]
>>> +-[ bpl-test return_arg ]
>>> +-[ bpl-test staticmethod ]
>>> +-[ bpl-test boost_shared_ptr ]
>>> +-[ bpl-test shared_ptr
>>> +-  : # sources
>>> +-  : [ requires cxx11_smart_ptr ]
>>> +-]
>>> +-[ bpl-test enable_shared_from_this ]
>>> +-[ bpl-test andreas_beyer ]
>>> +-[ bpl-test wrapper_held_type ]
>>> +-
>>> +-[ bpl-test polymorphism2_auto_ptr
>>> +-  : polymorphism2_auto_ptr.py polymorphism2.py 
>>> polymorphism2_auto_ptr.cpp
>>> +-]
>>> +-
>>> +-[ bpl-test polymorphism ]
>>> +-[ bpl-test polymorphism2 ]
>>> +-
>>> +-[ bpl-test auto_ptr ]
>>> +-
>>> +-[ bpl-test minimal ]
>>> +-[ bpl-test args ]
>>> +-[ bpl-test raw_ctor ]
>>> +-[ bpl-test enum : test_enum.py enum_ext.cpp ]
>>> +-[ bpl-test exception_translator ]
>>> +-[ bpl-test pearu1 : test_cltree.py cltree.cpp ]
>>> +-[ bpl-test try : newtest.py m1.cpp m2.cpp ]
>>> +-[ bpl-test const_argument ]
>>> +-[ bpl-test keywords : keywords.cpp keywords_test.py ]
>>> +-
>>> +-
>>> +-[ python-extension builtin_converters_ext : builtin_converters.cpp 
>>> /boost/python//boost_python ]
>>> +-[ bpl-test builtin_converters : test_builtin_converters.py 
>>> builtin_converters_ext ]
>>> +-
>>> +- [ bpl-test test_pointer_adoption ]
>>> +- [ bpl-test operators ]
>>> +- [ bpl-test operators_wrapper ]
>>> +- [ bpl-test callbacks ]
>>> +- [ bpl-test defaults ]
>>> +-
>>> +-[ bpl-test object ]
>>> +-[ bpl-test class ]
>>> +-[ bpl-test list ]
>>> +-[ bpl-test long ]
>>> +-[ bpl-test dict ]
>>> +-[ bpl-test tuple ]
>>> +-[ bpl-test str ]
>>> +-[ bpl-test slice ]
>>> +-
>>> +-[ bpl-test virtual_functions ]
>>> +-[ bpl-test back_reference ]
>>> +-[ bpl-test implicit ]
>>> +-[ bpl-test data_members ]
>>> +-
>>> +-[ bpl-test ben_scott1 ]
>>> +-
>>> +-[ bpl-test bienstman1 ]
>>> +-[ bpl-test bienstman2 ]
>>> +-[ bpl-test bienstman3 ]
>>> +-
>>> +-[ bpl-test multi_arg_constructor
>>> +-  : # files
>>> +-  : # requirements
>>> +-    # A bug in the Win32 intel compilers causes compilation of one 
>>> of our
>>> +-    # tests to take forever when debug symbols are enabled. This rule
>>> +-    # turns them off when added to the requirements section
>>> +-    <toolset>intel-win:<debug-symbols>off
>>> +-]
>>> +-
>>> +-[ bpl-test iterator : iterator.py iterator.cpp input_iterator.cpp ]
>>> +-
>>> +-[ bpl-test stl_iterator : stl_iterator.py stl_iterator.cpp ]
>>> +-
>>> +-[ bpl-test extract ]
>>> +-
>>> +-[
>>> +-bpl-test crossmod_opaque
>>> +-  : crossmod_opaque.py crossmod_opaque_a.cpp crossmod_opaque_b.cpp
>>> +-]
>>> +-[ bpl-test opaque ]
>>> +-[ bpl-test voidptr ]
>>> +-
>>> +-[ bpl-test pickle1 ]
>>> +-[ bpl-test pickle2 ]
>>> +-[ bpl-test pickle3 ]
>>> +-[ bpl-test pickle4 ]
>>> +-
>>> +-[ bpl-test nested ]
>>> +-
>>> +-[ bpl-test docstring ]
>>> +-[ bpl-test pytype_function ]
>>> +-
>>> +-[ bpl-test vector_indexing_suite ]
>>> +-
>>> +-[ bpl-test pointer_vector
>>> +-  : # files
>>> +-  : # requirements
>>> +-    # Turn off this test on HP CXX, as the test hangs when executing.
>>> +-    # Whenever the cause for the failure of the polymorphism test 
>>> is found
>>> +-    # and fixed, this should be retested.
>>> +-    <toolset>hp_cxx:<build>no ]
>>> +-
>>> +-[ python-extension map_indexing_suite_ext
>>> +-    : map_indexing_suite.cpp int_map_indexing_suite.cpp 
>>> a_map_indexing_suite.cpp
>>> +-    /boost/python//boost_python ]
>>> +-[ bpl-test
>>> +-    map_indexing_suite : map_indexing_suite.py 
>>> map_indexing_suite_ext ]
>>> +-
>>> +-[ run import_.cpp /boost/python//boost_python $(PY) : : import_.py ]
>>> +-
>>> +-# if $(TEST_BIENSTMAN_NON_BUGS)
>>> +-# {
>>> +-#     bpl-test bienstman4 ;
>>> +-#     bpl-test bienstman5 ;
>>> +-# }
>>> +-
>>> +-[ bpl-test calling_conventions : : <conditional>@require-windows ]
>>> +-[ bpl-test calling_conventions_mf : : <conditional>@require-windows ]
>>> +-
>>> + # --- unit tests of library components ---
>>> +
>>> + [ compile indirect_traits_test.cpp ]
>>> +-[ run destroy_test.cpp ]
>>> +-[ py-run pointer_type_id_test.cpp ]
>>> +-[ py-run bases.cpp ]
>>> +-[ run if_else.cpp ]
>>> +-[ py-run pointee.cpp ]
>>> +-[ run result.cpp ]
>>> +-
>>> +-[ compile string_literal.cpp ]
>>> +-[ py-compile borrowed.cpp ]
>>> +-[ py-compile object_manager.cpp ]
>>> +-[ py-compile copy_ctor_mutates_rhs.cpp ]
>>> +-
>>> +-[ py-run upcast.cpp ]
>>> +-
>>> +-[ py-compile select_holder.cpp ]
>>> +-
>>> +-[ run select_from_python_test.cpp ../src/converter/type_id.cpp
>>> +-  :
>>> +-  :
>>> +-  : <define>BOOST_PYTHON_STATIC_LIB
>>> +-    <use>$(PY)
>>> +-
>>> +-]
>>> +-
>>> +- [ py-compile select_arg_to_python_test.cpp ]
>>> +-
>>> +-[ py-compile-fail ./raw_pyobject_fail1.cpp ]
>>> +-[ py-compile-fail ./raw_pyobject_fail2.cpp ]
>>> +-[ py-compile-fail ./as_to_python_function.cpp ]
>>> +-[ py-compile-fail ./object_fail1.cpp ]
>>> +-
>>> +-# --- NumPy tests ---
>>> +-
>>> +-[ numpy-test numpy/dtype ]
>>> +-[ numpy-test numpy/ufunc ]
>>> +-[ numpy-test numpy/templates ]
>>> +-[ numpy-test numpy/ndarray ]
>>> +-[ numpy-test numpy/indexing ]
>>> +-[ numpy-test numpy/shapes ]
>>> +-
>>> +
>>> +   ;
>>> +diff --git a/libs/random/test/Jamfile.v2 b/libs/random/test/Jamfile.v2
>>> +index 25424bc..275194a 100644
>>> +--- a/libs/random/test/Jamfile.v2
>>> ++++ b/libs/random/test/Jamfile.v2
>>> +@@ -15,7 +15,6 @@ run test_generate_canonical.cpp 
>>> /boost//unit_test_framework ;
>>> + run test_random_number_generator.cpp /boost//unit_test_framework ;
>>> + run ../example/random_demo.cpp ;
>>> + run test_random_device.cpp /boost//random : : : <link>static : 
>>> test_random_device ;
>>> +-run test_random_device.cpp /boost//random : : : <link>shared : 
>>> test_random_device_dll ;
>>> +
>>> + run test_minstd_rand0.cpp /boost//unit_test_framework ;
>>> + run test_minstd_rand.cpp /boost//unit_test_framework ;
>>> +diff --git a/libs/serialization/test/Jamfile.v2 
>>> b/libs/serialization/test/Jamfile.v2
>>> +index 8a62c8f..3018e38 100644
>>> +--- a/libs/serialization/test/Jamfile.v2
>>> ++++ b/libs/serialization/test/Jamfile.v2
>>> +@@ -60,60 +60,6 @@ test-suite "serialization" :
>>> +      [ test-bsl-run_files test_delete_pointer ]
>>> +      [ test-bsl-run_files test_deque : A ]
>>> +      [ test-bsl-run_files test_derived ]
>>> +-     [ test-bsl-run_files test_derived_class : A ]
>>> +-     [ test-bsl-run_files test_derived_class_ptr : A ]
>>> +-     [ test-bsl-run_files test_diamond ]
>>> +-     [ test-bsl-run_files test_diamond_complex ]
>>> +-     [ test-bsl-run_files test_exported : polymorphic_base ]
>>> +-     [ test-bsl-run_files test_forward_list : A  : :  [ requires 
>>> cxx11_hdr_forward_list ] ] # BOOST_NO_CXX11_HDR_FORWARD_LIST
>>> +-     [ test-bsl-run_files test_forward_list_ptrs : A  : :  [ 
>>> requires cxx11_hdr_forward_list ] ] # BOOST_NO_CXX11_HDR_FORWARD_LIST
>>> +-     [ test-bsl-run_files test_helper_support ]
>>> +-     [ test-bsl-run_files test_interrupts ]
>>> +-     [ test-bsl-run_files test_list : A ]
>>> +-     [ test-bsl-run_files test_list_ptrs : A ]
>>> +-     [ test-bsl-run_files test_map : A ]
>>> +-     [ test-bsl-run_files test_map_hashed : A : : [ requires hash 
>>> ] ] # BOOST_HAS_HASH
>>> +-     [ test-bsl-run_files test_map_unordered : A : :  [ requires 
>>> cxx11_hdr_unordered_map ] ] # BOOST_NO_CXX11_HDR_UNORDERED_MAP
>>> +-     [ test-bsl-run_files test_map_boost_unordered : A ]
>>> +-     [ test-bsl-run_files test_mi ]
>>> +-     [ test-bsl-run_files test_multiple_ptrs : A ]
>>> +-     [ test-bsl-run_files test_multiple_inheritance ]
>>> +-     [ test-bsl-run_files test_no_rtti : polymorphic_base 
>>> polymorphic_derived1 ]
>>> +-     [ test-bsl-run_files test_non_intrusive ]
>>> +-     [ test-bsl-run_files test_non_default_ctor ]
>>> +-     [ test-bsl-run_files test_non_default_ctor2 ]
>>> +-     [ test-bsl-run_files test_null_ptr ]
>>> +-     [ test-bsl-run_files test_nvp : A ]
>>> +-     [ test-bsl-run_files test_object ]
>>> +-     [ test-bsl-run_files test_primitive ]
>>> +-     [ test-bsl-run_files test_priority_queue : A ]
>>> +-     [ test-bsl-run_files test_queue : A ]
>>> +-     [ test-bsl-run_files test_recursion : A ]
>>> +-     [ test-bsl-run_files test_registered ]
>>> +-     [ test-bsl-run_files test_set : A ]
>>> +-     [ test-bsl-run_files test_set_hashed : A : : [ requires hash 
>>> ] ] # BOOST_HAS_HASH
>>> +-     [ test-bsl-run_files test_set_unordered : A : :  [ requires 
>>> cxx11_hdr_unordered_set ] ] # BOOST_NO_CXX11_HDR_UNORDERED_SET
>>> +-     [ test-bsl-run_files test_set_boost_unordered : A ]
>>> +-     [ test-bsl-run_files test_simple_class : A ]
>>> +-     [ test-bsl-run_files test_simple_class_ptr : A ]
>>> +-     [ test-bsl-run_files test_slist : A : : [ requires slist ] ] 
>>> # BOOST_HAS_SLIST ]
>>> +-     [ test-bsl-run_files test_slist_ptrs : A : : [ requires slist 
>>> ] ] # BOOST_HAS_SLIST ] ]
>>> +-     [ test-bsl-run_files test_split ]
>>> +-     [ test-bsl-run_files test_stack : A ]
>>> +-     [ test-bsl-run_files test_tracking ]
>>> +-     [ test-bsl-run_files test_unregistered ]
>>> +-     [ test-bsl-run_files test_unique_ptr ]
>>> +-     [ test-bsl-run_files test_valarray ]
>>> +-     [ test-bsl-run_files test_variant : A ]
>>> +-     [ test-bsl-run_files test_vector : A ]
>>> +-     [ test-bsl-run_files test_new_operator : A ]
>>> +-     [ test-bsl-run_files test_optional ]
>>> +-     [ test-bsl-run_files test_shared_ptr ]
>>> +-     [ test-bsl-run_files test_shared_ptr_multi_base ]
>>> +-     [ test-bsl-run_files test_shared_ptr_132 : : : [ requires 
>>> auto_ptr  ] ] # BOOST_NO_AUTO_PTR
>>> +-     [ test-bsl-run_polymorphic_archive test_polymorphic : 
>>> test_polymorphic_A A ]
>>> +-     [ test-bsl-run_polymorphic_archive test_polymorphic2 : 
>>> test_polymorphic2imp ]
>>> +-     [ test-bsl-run_polymorphic_archive test_polymorphic_helper ]
>>> +
>>> +      # should compile
>>> +      [ compile test_strong_typedef.cpp ]
>>> +diff --git a/libs/timer/test/Jamfile.v2 b/libs/timer/test/Jamfile.v2
>>> +index 567a220..0b584c1 100644
>>> +--- a/libs/timer/test/Jamfile.v2
>>> ++++ b/libs/timer/test/Jamfile.v2
>>> +@@ -20,26 +20,6 @@ project
>>> +
>>> +    test-suite "timer"
>>> +    :
>>> +-     [ run ../example/auto_cpu_timer_example.cpp
>>> +-       : # command line
>>> +-       : # input files
>>> +-       : <test-info>always_show_run_output # requirements
>>> +-     ]
>>> +-     [ run cpu_timer_info.cpp
>>> +-       : # command line
>>> +-       : # input files
>>> +-       : <test-info>always_show_run_output # requirements
>>> +-     ]
>>> +-     [ run cpu_timer_test.cpp
>>> +-       : # command line
>>> +-       : # input files
>>> +-       : <test-info>always_show_run_output # requirements
>>> +-     ]
>>> +-     [ run ../example/timex.cpp
>>> +-       : echo "Hello, world"
>>> +-         :
>>> +-         : <test-info>always_show_run_output
>>> +-     ]
>>> +      [ compile original_timer_test.cpp
>>> +      ]
>>> +      [ run chrono_conflict_test.cpp /boost/chrono//boost_chrono : 
>>> : : <link>static
>>> +--
>>> +2.7.4
>>> +
>>> diff --git 
>>> a/meta/recipes-support/boost/boost/boost-remove-rpath.patch 
>>> b/meta/recipes-support/boost/boost/boost-remove-rpath.patch
>>> new file mode 100644
>>> index 0000000000..b5939b784d
>>> --- /dev/null
>>> +++ b/meta/recipes-support/boost/boost/boost-remove-rpath.patch
>>> @@ -0,0 +1,28 @@
>>> +From 879c30c7802428ba52620b7b83efb4b673fddcba Mon Sep 17 00:00:00 2001
>>> +From: Mingli Yu <Mingli.Yu@windriver.com>
>>> +Date: Thu, 3 May 2018 14:17:10 +0800
>>> +Subject: [PATCH] gcc.jam: remove rpath
>>> +
>>> +Upstream-Status: Inappropriate [embedded specific]
>>> +
>>> +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>> +---
>>> + tools/build/src/tools/gcc.jam | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/tools/build/src/tools/gcc.jam 
>>> b/tools/build/src/tools/gcc.jam
>>> +index a8fc7ef..39cd54b 100644
>>> +--- a/tools/build/src/tools/gcc.jam
>>> ++++ b/tools/build/src/tools/gcc.jam
>>> +@@ -975,7 +975,7 @@ rule link ( targets * : sources * : properties * )
>>> +
>>> + actions link bind LIBRARIES
>>> + {
>>> +-    "$(CONFIG_COMMAND)" -L"$(LINKPATH)" 
>>> -Wl,$(RPATH_OPTION:E=-R)$(SPACE)-Wl,$(RPATH) 
>>> -Wl,-rpath-link$(SPACE)-Wl,"$(RPATH_LINK)" -o "$(<)" $(START-GROUP) 
>>> "$(>)" "$(LIBRARIES)" $(FINDLIBS-ST-PFX) -l$(FINDLIBS-ST) 
>>> $(FINDLIBS-SA-PFX) -l$(FINDLIBS-SA) $(END-GROUP) $(OPTIONS) 
>>> $(USER_OPTIONS)
>>> ++    "$(CONFIG_COMMAND)" -L"$(LINKPATH)" -o "$(<)" $(START-GROUP) 
>>> "$(>)" "$(LIBRARIES)" $(FINDLIBS-ST-PFX) -l$(FINDLIBS-ST) 
>>> $(FINDLIBS-SA-PFX) -l$(FINDLIBS-SA) $(END-GROUP) $(OPTIONS) 
>>> $(USER_OPTIONS)
>>> + }
>>> +
>>> + rule link.dll ( targets * : sources * : properties * )
>>> +--
>>> +2.7.4
>>> +
>>> diff --git 
>>> a/meta/recipes-support/boost/boost/boost-testing-hack-the-rules-for-ptest.patch 
>>> b/meta/recipes-support/boost/boost/boost-testing-hack-the-rules-for-ptest.patch 
>>>
>>> new file mode 100644
>>> index 0000000000..2066ccbdf0
>>> --- /dev/null
>>> +++ 
>>> b/meta/recipes-support/boost/boost/boost-testing-hack-the-rules-for-ptest.patch 
>>>
>>> @@ -0,0 +1,53 @@
>>> +From 243e0bf54e20827fe9b3e792133ba8bf7950e369 Mon Sep 17 00:00:00 2001
>>> +From: Jackie Huang <jackie.huang@windriver.com>
>>> +Date: Wed, 12 Oct 2016 16:11:45 +0800
>>> +Subject: [PATCH] testing: hack the rules for ptest
>>> +
>>> +The rules for tests don't work in cross-compiling,
>>> +they try to run the executable after compiling and
>>> +linking the test program, so hack the rules here
>>> +so they will be almost the same as the 'link' rule
>>> +except that they accept more parameters.
>>> +
>>> +And the running logic will be added in run-ptest
>>> +
>>> +Upstream-Status: Inappropriate [OE ptest specific]
>>> +
>>> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>> +---
>>> + tools/build/src/tools/mpi.jam     | 2 +-
>>> + tools/build/src/tools/testing.jam | 4 +---
>>> + 2 files changed, 2 insertions(+), 4 deletions(-)
>>> +
>>> +diff --git a/tools/build/src/tools/mpi.jam 
>>> b/tools/build/src/tools/mpi.jam
>>> +index 1cb8331..485e9d1 100644
>>> +--- a/tools/build/src/tools/mpi.jam
>>> ++++ b/tools/build/src/tools/mpi.jam
>>> +@@ -631,7 +631,7 @@ rule mpi-test ( name : sources * : requirements 
>>> * : schedule * )
>>> +     for processes in $(schedule)
>>> +     {
>>> +       result += [ testing.make-test
>>> +-        run-mpi : $(sources) /boost/mpi//boost_mpi
>>> ++        link : $(sources) /boost/mpi//boost_mpi
>>> +           : $(requirements) <toolset>msvc:<link>static 
>>> <mpi:processes>$(processes) : $(name)-$(processes) ] ;
>>> +     }
>>> +     return $(result) ;
>>> +diff --git a/tools/build/src/tools/testing.jam 
>>> b/tools/build/src/tools/testing.jam
>>> +index a6c5cc3..687d09b 100644
>>> +--- a/tools/build/src/tools/testing.jam
>>> ++++ b/tools/build/src/tools/testing.jam
>>> +@@ -191,9 +191,7 @@ rule run ( sources + : args * : input-files * : 
>>> requirements * : target-name ? :
>>> + {
>>> +     param.handle-named-params sources args input-files requirements
>>> +         target-name default-build ;
>>> +-    requirements += <testing.arg>$(args:J=" ") ;
>>> +-    requirements += [ handle-input-files $(input-files) ] ;
>>> +-    return [ make-test run : $(sources) : $(requirements) : 
>>> $(target-name) ] ;
>>> ++    return [ make-test link : $(sources) : $(requirements) : 
>>> $(target-name) ] ;
>>> + }
>>> +
>>> +
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-support/boost/boost/run-ptest 
>>> b/meta/recipes-support/boost/boost/run-ptest
>>> new file mode 100644
>>> index 0000000000..9057200a85
>>> --- /dev/null
>>> +++ b/meta/recipes-support/boost/boost/run-ptest
>>> @@ -0,0 +1,41 @@
>>> +#!/bin/sh
>>> +
>>> +PTESTPATH="$(dirname $0)"
>>> +LIBS="@BOOST_LIBS@"
>>> +LOG="boost_ptest_$(date +%Y%m%d-%H%M%S).log"
>>> +
>>> +lib_num=1
>>> +
>>> +for lib in ${LIBS}; do
>>> +
>>> +    # ignore python3 since there is no such
>>> +    # sub-dir in libs
>>> +    [ ${lib} = "python3" ] && continue
>>> +    # ignore the folder which contains no test
>>> +    [ "`ls -A ${PTESTPATH}/${lib}`" = "" ] && continue
>>> +
>>> +    test_num=1
>>> +
>>> +    for test in ${PTESTPATH}/${lib}/*; do
>>> +        testname=`basename ${test}`
>>> +        echo
>>> +        echo "=== Test ${lib_num}-${test_num} ${lib}/${testname}: 
>>> Start ==="
>>> +        ./${test}
>>> +        [ $? = 0 ] && echo "PASS: ${lib}/${testname}" || echo 
>>> "FAIL: ${lib}/${testname}"
>>> +        echo "=== Test ${lib_num}-${test_num} ${lib}/${testname}: 
>>> Done ==="
>>> +        echo
>>> +        test_num=$((test_num + 1))
>>> +    done 2>&1|tee -a ${PTESTPATH}/${LOG}
>>> +
>>> +    lib_num=$((lib_num+1))
>>> +done
>>> +
>>> +passed=`grep PASS: ${PTESTPATH}/${LOG}|wc -l`
>>> +failed=`grep FAIL: ${PTESTPATH}/${LOG}|wc -l`
>>> +all=$((passed + failed))
>>> +
>>> +( echo "=== Test Summary ==="
>>> +  echo "TOTAL: ${all}"
>>> +  echo "PASSED: ${passed}"
>>> +  echo "FAILED: ${failed}"
>>> +) | tee -a ${PTESTPATH}/${LOG}
>>>
>
>


